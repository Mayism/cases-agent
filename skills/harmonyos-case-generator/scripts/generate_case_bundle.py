from __future__ import annotations

import argparse
import fnmatch
import os
import re
import shutil
import subprocess
import zipfile
from datetime import datetime
from pathlib import Path


SCENARIO_LABELS = {
    "full_generation": "full_generation",
    "requirement": "requirement",
    "bug_fix": "bug_fix",
}

ALLOWED_CONSTRAINT_PRIORITIES = {"P0", "P1"}
CONSTRAINT_ID_PATTERN = re.compile(r"^EXP-(MUST|SHOULD)-\d{2}$")

INDUSTRY_KEYWORDS = {
    "医疗": ["医疗", "医院", "门诊", "问诊", "健康", "医护"],
    "教育": ["教育", "教学", "校园", "学习", "课堂", "培训"],
    "零售": ["零售", "商城", "商超", "门店", "电商", "商品"],
    "金融": ["金融", "银行", "证券", "基金", "理财", "保险"],
    "文旅": ["文旅", "旅游", "景区", "出行", "酒店", "民宿"],
    "政务": ["政务", "政企", "政服务", "便民", "办事大厅"],
    "工业": ["工业", "制造", "工厂", "生产", "巡检", "设备"],
    "物流": ["物流", "仓储", "配送", "货运", "运力"],
    "社区": ["社区", "物业", "园区", "邻里", "住户"],
    "餐饮": ["餐饮", "点餐", "外卖", "餐厅", "门店运营"],
}

INDUSTRY_DIRECTION_LIBRARY = {
    "医疗": [
        {
            "title": "门诊导诊与检查陪诊助手",
            "summary": "围绕挂号、科室导航、检查排队和结果提醒，构建患者到院后的核心服务闭环。",
            "highlights": [
                "首页提供就诊任务卡片、科室入口和当日进度总览",
                "结合地图与定位能力实现院内导航、楼层切换和目标科室指引",
                "检查预约、排队进度、结果回传和消息提醒形成完整链路",
            ],
        },
        {
            "title": "慢病随访与健康打卡助手",
            "summary": "围绕用药提醒、指标记录、异常告警和复诊预约，构建院外持续管理场景。",
            "highlights": [
                "支持血压、血糖等健康指标录入与趋势展示",
                "通过通知能力完成用药提醒、复查提醒和异常告警",
                "提供医生建议回看、复诊预约和家属协同入口",
            ],
        },
    ],
    "教育": [
        {
            "title": "课堂任务与作业协同平台",
            "summary": "面向教师和学生的课堂内外任务协同，覆盖布置、提交、批改和反馈。",
            "highlights": [
                "课堂首页聚合课程、作业、待办和消息提醒",
                "支持拍照上传、作业状态追踪和批注反馈",
                "提供学生端与教师端的角色化页面和交互差异",
            ],
        },
        {
            "title": "校园服务一站式助手",
            "summary": "围绕课表、签到、教室导航和校园通知，提升校内高频事务处理效率。",
            "highlights": [
                "整合课表、考试、活动和校园公告入口",
                "利用定位能力支持签到、教室查找和校园路线指引",
                "覆盖请假申请、审批结果反馈和异常状态提示",
            ],
        },
    ],
    "零售": [
        {
            "title": "门店导购与会员转化助手",
            "summary": "围绕商品导购、会员识别、优惠推荐和到店转化，打造线下零售主链路。",
            "highlights": [
                "首页展示活动会场、商品分类和会员权益入口",
                "支持扫码识别商品、查看详情和加入会员活动",
                "覆盖优惠券领取、下单转化和售后反馈流程",
            ],
        },
        {
            "title": "巡店补货与陈列检查助手",
            "summary": "面向门店运营人员，覆盖巡检、缺货上报、补货任务和异常闭环。",
            "highlights": [
                "任务列表联动门店状态、区域筛选和优先级排序",
                "支持相机拍照、问题记录和整改反馈",
                "提供库存异常、补货进度和消息提醒能力",
            ],
        },
    ],
    "金融": [
        {
            "title": "财富账户概览与产品推荐助手",
            "summary": "围绕资产总览、产品筛选、风险提示和购买流程，提供轻量理财体验。",
            "highlights": [
                "首页展示资产概览、收益趋势和精选产品",
                "支持产品详情、风险揭示、购买确认和结果反馈",
                "通过消息提醒覆盖收益波动、到期提示和交易结果",
            ],
        },
        {
            "title": "网点预约与远程服务助手",
            "summary": "聚焦客户到店前后的服务流程，覆盖预约、排队、材料准备和进度通知。",
            "highlights": [
                "支持网点搜索、预约时段选择和材料清单查看",
                "结合定位与地图能力进行网点导航和签到提醒",
                "提供办理进度、补件通知和服务评价闭环",
            ],
        },
    ],
    "文旅": [
        {
            "title": "景区导览与行程规划助手",
            "summary": "围绕景点导览、路线推荐、演出提醒和服务预订，构建游前游中闭环。",
            "highlights": [
                "首页展示推荐路线、热度景点和活动日历",
                "结合地图定位能力支持路线导航与附近服务发现",
                "提供门票预约、演出提醒和游后评价反馈",
            ],
        },
        {
            "title": "酒店住中服务助手",
            "summary": "聚焦入住后的高频服务，覆盖房态查看、餐饮预约、报修和离店提醒。",
            "highlights": [
                "支持房间服务入口、活动推荐和消息通知",
                "提供报修、客房服务、餐饮预约和进度反馈",
                "覆盖离店提醒、账单查看和评价提交流程",
            ],
        },
    ],
}

IGNORE_DIRS = {
    ".git",
    ".idea",
    ".hvigor",
    "build",
    "dist",
    "node_modules",
    "oh_modules",
    "output",
}

KIT_HINTS = {
    "mapkit": ["mapkit", "mapcomponent", "地图", "导航", "poi"],
    "location": ["location", "定位", "当前位置", "geolocationmanager", "requestpermissionsfromuser"],
    "payment": ["payment", "支付", "pay", "paymentkit"],
    "camera": ["camera", "拍照", "扫码", "scankit"],
    "push": ["push", "通知", "推送"],
    "account": ["account", "登录", "authentication", "accountkit"],
    "ai": ["ai", "智能", "大模型", "识别"],
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Generate HarmonyOS case bundle under data/cases.")
    parser.add_argument(
        "--project-path",
        help="HarmonyOS project path. Optional for full_generation when industry info can be inferred from request.",
    )
    parser.add_argument("--request", help="User request in natural language")
    parser.add_argument("--scenario", choices=sorted(SCENARIO_LABELS), help="Optional explicit scenario")
    parser.add_argument("--case-id", help="Optional explicit case id")
    parser.add_argument("--output-root", default="data/cases", help="Root directory for generated cases")
    parser.add_argument(
        "--zip-only-project-root",
        help="Only create or refresh original_project.zip for an already prepared project root.",
    )
    parser.add_argument(
        "--defer-zip",
        action="store_true",
        help="Copy original_project and generate case.yaml, but wait for manual/agent edits before zipping.",
    )
    return parser.parse_args()


def detect_scenario(request_text: str) -> str:
    text = request_text.lower()
    if any(token in text for token in ["bug", "修复", "缺陷", "报错", "异常", "问题"]):
        return "bug_fix"
    if any(token in text for token in ["全新", "从零", "新开发", "完整工程", "full_generation", "全量生成"]):
        return "full_generation"
    return "requirement"


def detect_scenario_without_project(request_text: str) -> str:
    text = request_text.lower()
    if any(token in text for token in ["bug", "修复", "缺陷", "报错", "异常", "问题"]):
        return "bug_fix"
    if any(token in text for token in ["新增", "扩展", "接入", "优化现有", "基于现有", "requirement"]):
        return "requirement"
    return "full_generation"


def is_deletion_based_requirement(request_text: str) -> bool:
    """Return true for incremental cases that must remove existing code before zipping."""
    text = request_text.lower()
    deletion_markers = [
        "剥离",
        "裁剪",
        "从当前工程中删除",
        "从当前工程删除",
        "已有功能删除",
        "删除后形成",
        "删除或弱化",
        "恢复/补齐",
        "恢复该",
        "补齐该",
        "恢复能力",
        "补齐能力",
    ]
    return any(marker in text for marker in deletion_markers)


def slugify(value: str) -> str:
    lowered = value.lower()
    slug = re.sub(r"[^a-z0-9\u4e00-\u9fff]+", "_", lowered).strip("_")
    slug = re.sub(r"_+", "_", slug)
    return slug or "case"


def infer_case_id(scenario: str, source_name: str, request_text: str) -> str:
    project_name = slugify(source_name)
    snippet = slugify(request_text[:36])
    timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
    return f"{scenario}_{project_name}_{snippet}_{timestamp}"


def extract_industry(request_text: str) -> str:
    lowered = request_text.lower()
    for industry, keywords in INDUSTRY_KEYWORDS.items():
        if any(keyword.lower() in lowered for keyword in keywords):
            return industry

    match = re.search(r"([\u4e00-\u9fffA-Za-z0-9]{2,12})(行业|领域|赛道)", request_text)
    if match:
        return match.group(1)

    match = re.search(r"(面向|针对|服务于)([\u4e00-\u9fffA-Za-z0-9]{2,12})", request_text)
    if match:
        return match.group(2)

    return ""


def read_text_if_exists(path: Path) -> str:
    if not path.is_file():
        return ""
    for encoding in ("utf-8", "utf-8-sig", "gb18030"):
        try:
            return path.read_text(encoding=encoding)
        except UnicodeDecodeError:
            continue
    return path.read_text(encoding="utf-8", errors="ignore")


def find_readme(project_path: Path) -> Path | None:
    candidates = [
        project_path / "README.md",
        project_path / "readme.md",
        project_path / "Readme.md",
    ]
    for candidate in candidates:
        if candidate.is_file():
            return candidate
    for root, dirs, files in os.walk(project_path):
        dirs[:] = [item for item in dirs if item not in IGNORE_DIRS]
        for filename in files:
            if filename.lower() == "readme.md":
                return Path(root) / filename
    return None


def collect_source_files(project_path: Path) -> list[Path]:
    results: list[Path] = []
    allowed_suffixes = {".ets", ".ts", ".js", ".json5", ".md"}
    for root, dirs, files in os.walk(project_path):
        dirs[:] = [item for item in dirs if item not in IGNORE_DIRS]
        for filename in files:
            path = Path(root) / filename
            if path.suffix.lower() in allowed_suffixes:
                results.append(path)
    return results


def summarize_project(project_path: Path) -> dict:
    files = collect_source_files(project_path)
    readme_path = find_readme(project_path)
    readme_text = read_text_if_exists(readme_path) if readme_path else ""

    page_files = [path for path in files if "/pages/" in path.as_posix()]
    component_files = [path for path in files if "/components/" in path.as_posix()]
    model_files = [path for path in files if any(token in path.name.lower() for token in ["model", "viewmodel", "vm"])]
    config_files = [path for path in files if path.name in {"module.json5", "app.json5", "build-profile.json5"}]

    text_for_detection = "\n".join(
        [readme_text[:4000]] + [read_text_if_exists(path)[:2000] for path in files[:20]]
    ).lower()

    kits: list[str] = []
    for name, hints in KIT_HINTS.items():
        if any(hint in text_for_detection for hint in hints):
            kits.append(name)

    return {
        "project_name": project_path.name,
        "readme_path": str(readme_path) if readme_path else "",
        "readme_excerpt": "\n".join(readme_text.splitlines()[:20]).strip(),
        "pages": [path.relative_to(project_path).as_posix() for path in page_files[:10]],
        "components": [path.relative_to(project_path).as_posix() for path in component_files[:12]],
        "models": [path.relative_to(project_path).as_posix() for path in model_files[:10]],
        "configs": [path.relative_to(project_path).as_posix() for path in config_files[:10]],
        "kits": kits,
    }


def build_recommended_directions(industry: str) -> list[dict]:
    directions = INDUSTRY_DIRECTION_LIBRARY.get(industry)
    if directions:
        return directions

    return [
        {
            "title": f"{industry} 场景服务闭环助手",
            "summary": f"围绕 {industry} 用户的高频服务流程，构建从入口、办理、结果反馈到消息提醒的完整链路。",
            "highlights": [
                "首页聚合核心业务入口、待办事项和关键状态卡片",
                "提供主流程办理、异常兜底和结果回显能力",
                "结合通知、定位、相机等 HarmonyOS 能力增强服务体验",
            ],
        },
        {
            "title": f"{industry} 数据运营与任务协同助手",
            "summary": f"聚焦 {industry} 场景下的任务流转、数据看板、异常上报和处理协同。",
            "highlights": [
                "支持任务列表、筛选分发、状态跟踪和处理记录",
                "提供数据概览、趋势分析和关键指标提示",
                "覆盖异常上报、消息提醒、处理反馈与复盘闭环",
            ],
        },
    ]


def render_recommendations_markdown(industry: str, request_text: str, directions: list[dict]) -> str:
    lines = [
        "# 产品方向推荐",
        "",
        "## 一、识别结果",
        f"- 用户请求：{request_text.strip()}",
        f"- 提取行业：{industry}",
        "",
        "## 二、推荐方向",
    ]

    for index, direction in enumerate(directions, start=1):
        lines.extend(
            [
                f"### 方向 {index}：{direction['title']}",
                f"- 方向概述：{direction['summary']}",
                "- 建议包含：",
            ]
        )
        lines.extend(f"  - {item}" for item in direction["highlights"])
        lines.append("")

    lines.extend(
        [
            "## 三、下一步建议",
            "- 请从以上两个方向中选择一个，再继续生成 full_generation 的 PRD 与 case.yaml。",
            "- 如果两个方向都不合适，请补充更具体的目标用户、核心场景或参考工程。",
        ]
    )
    return "\n".join(lines).strip()


def build_title(scenario: str, request_text: str, project_summary: dict) -> str:
    request_text = request_text.strip()
    if request_text:
        return request_text[:60]
    mapping = {
        "full_generation": f"基于 {project_summary['project_name']} 生成全新开发评测用例",
        "requirement": f"基于 {project_summary['project_name']} 生成增量开发评测用例",
        "bug_fix": f"基于 {project_summary['project_name']} 生成问题修复评测用例",
    }
    return mapping[scenario]


def build_prd(request_text: str, project_summary: dict) -> str:
    pages = project_summary["pages"] or ["当前工程页面结构待扩展"]
    components = project_summary["components"] or ["当前工程组件结构待扩展"]
    kits = project_summary["kits"] or ["待按场景接入 HarmonyOS kit 能力"]
    readme_excerpt = project_summary["readme_excerpt"] or "未读取到 README.md，可结合现有代码结构补全产品约束。"

    lines = [
        f"# 产品需求文档",
        "",
        "## 一、需求背景",
        request_text.strip(),
        "",
        "## 二、现有工程基线",
        f"- 工程名称：{project_summary['project_name']}",
        f"- README 摘要：{readme_excerpt}",
        "- 已识别页面：",
    ]
    lines.extend(f"  - {item}" for item in pages)
    lines.append("- 已识别组件：")
    lines.extend(f"  - {item}" for item in components)
    lines.append("")
    lines.append("## 三、业务功能")
    lines.extend(
        [
            "- 基于现有工程抽取可复用页面结构与业务入口，补全与用户请求直接相关的核心能力。",
            "- 明确首页、详情页、结果页、设置页或功能入口页之间的业务闭环，避免只做静态页面。",
            "- 如涉及账号、位置、支付、地图、相机、通知等能力，需形成完整调用链与结果反馈。",
        ]
    )
    lines.append("")
    lines.append("## 四、交互逻辑")
    lines.extend(
        [
            "- 首次进入时展示核心业务入口与主视图，不允许关键功能藏在不可发现的深层路径。",
            "- 用户触发关键操作后，页面应完成参数传递、状态切换、结果回显和异常提示。",
            "- 授权失败、接口失败、空数据、网络异常等场景必须提供可继续操作的降级态。",
        ]
    )
    lines.append("")
    lines.append("## 五、技术约束")
    lines.extend(
        [
            "- 保持 HarmonyOS 工程可编译结构，不破坏现有模块入口与基础配置。",
            "- 组件拆分必须清晰：页面负责编排，通用组件负责展示，状态管理或 ViewModel 负责数据与交互逻辑。",
            "- 状态管理优先沿用工程现有模式；若工程使用 ArkUI V2，优先保持 @ObservedV2 / @Trace 等约定。",
            f"- 重点关注 kit 能力接入：{', '.join(kits)}。",
            "- kit 接入时同步检查权限声明、模块配置、能力调用、失败兜底与日志脱敏。",
            "- 避免把业务逻辑、权限申请、网络请求和组件渲染全部塞进单一页面文件。",
        ]
    )
    lines.append("")
    lines.append("## 六、交付要求")
    lines.extend(
        [
            "- 生成的代码需体现真实页面、组件、状态和配置改动。",
            "- 回答中需说明关键文件、主链路实现方式、异常处理与技术取舍。",
        ]
    )
    return "\n".join(lines).strip()


def build_requirement_prompt(request_text: str, project_summary: dict) -> str:
    pages = project_summary["pages"] or ["待识别真实页面入口"]
    components = project_summary["components"] or ["待识别公共组件"]
    kits = project_summary["kits"] or ["如需求涉及 HarmonyOS Kit，需补齐权限、配置、调用和失败兜底"]
    readme_excerpt = project_summary["readme_excerpt"] or "未读取到 README.md，以现有代码结构为准。"
    deletion_based = is_deletion_based_requirement(request_text)
    action_word = "恢复/补齐" if deletion_based else "新增/扩展"

    lines = [
        "请基于当前 HarmonyOS 工程完成增量开发，不要从零重建工程。",
        "",
        "## 一、业务背景和目标",
        request_text.strip(),
        f"- 目标是在现有链路上{action_word}可交互能力，覆盖入口、操作、状态反馈和结果回显。",
        "",
        "## 二、现有工程基线",
        f"- 工程名称：{project_summary['project_name']}",
        f"- README 摘要：{readme_excerpt}",
        f"- 可复用页面：{'; '.join(pages[:6])}",
        f"- 可复用组件：{'; '.join(components[:6])}",
        "- 开发前先理解现有页面、组件、ViewModel/model、路由、资源和模块配置，优先沿用当前工程组织方式。",
        "",
        "## 三、新增功能范围",
    ]
    if deletion_based:
        lines.extend(
            [
                "- `original_project` 中已删除或裁剪相关已有能力，需要恢复/补齐页面入口、组件展示、状态流转、数据模型、路由参数、资源引用或 Kit 调用封装。",
                "- 恢复后必须与保留的原有链路重新接通，不要另起孤岛页面。",
            ]
        )
    else:
        lines.extend(
            [
                "- 在当前工程基础上新增或扩展功能入口、核心页面/组件、状态处理、数据模型和结果反馈。",
                "- 新能力应接入现有首页、列表、详情、表单、设置或业务入口，不要只做单页静态演示。",
            ]
        )
    lines.extend(
        [
            "- 覆盖加载中、成功、失败、空数据、取消/返回、重复触发等关键状态；跨页面流程需处理参数传递和返回态恢复。",
            "",
            "## 四、技术接入要求",
            "- 页面负责编排，组件负责展示，ViewModel/model/types 负责状态和业务逻辑，避免把逻辑塞进 `build()`。",
            "- 复用已有公共组件、主题资源、mock 数据、网络/缓存封装，并沿用当前 `Navigation`、`NavPathStack`、路由表或跳转模式。",
            f"- Kit/平台能力关注：{', '.join(kits[:5])}。",
            "- 涉及定位、地图、相机、扫码、账号、支付、通知、分享等 Kit 时，补齐 `module.json5` 权限/能力声明、运行时授权、结果处理、失败降级和用户可继续操作路径。",
            "- 保持工程可编译，改动应落在页面、组件、ViewModel/model/types、路由配置、资源或 mock 等合理文件中，不能破坏现有主流程。",
        ]
    )
    return "\n".join(lines).strip()


def infer_ast_rules(request_text: str, project_summary: dict, scenario: str) -> list[dict]:
    text = f"{request_text}\n{' '.join(project_summary['kits'])}".lower()
    constraints: list[dict] = []

    if "map" in text or "地图" in request_text:
        constraints.append(
            {
                "id": "EXP-MUST-01",
                "name": "地图主链路必须真实接入地图组件",
                "priority": "P0",
                "rules": [
                    {
                        "target": "**/pages/*.ets",
                        "ast": [{"type": "call", "name": "MapComponent"}],
                        "llm": "检查页面是否真实使用地图组件作为主视图，而不是静态占位。",
                    }
                ],
            }
        )

    if "location" in text or "定位" in request_text:
        constraints.append(
            {
                "id": "EXP-MUST-02",
                "name": "定位能力必须包含权限申请与位置获取调用",
                "priority": "P0",
                "rules": [
                    {
                        "target": "**/*.ets",
                        "ast": [
                            {"type": "call", "name": "requestPermissionsFromUser"},
                            {"type": "call", "name": "getCurrentLocation"},
                        ],
                        "llm": "检查是否形成权限申请到位置结果消费的完整链路。",
                    }
                ],
            }
        )

    if "payment" in text or "支付" in request_text:
        constraints.append(
            {
                "id": "EXP-MUST-03",
                "name": "支付能力必须存在 kit 接入证据与支付结果反馈",
                "priority": "P0",
                "rules": [
                    {
                        "target": "**/*.ets",
                        "ast": [{"type": "import", "name": "PaymentKit"}],
                        "llm": "检查是否真实接入支付 kit，并处理支付成功、失败或取消状态。",
                    }
                ],
            }
        )

    if scenario == "bug_fix" and ("foreach" in text or "刷新" in request_text or "列表" in request_text):
        constraints.append(
            {
                "id": "EXP-MUST-04",
                "name": "问题修复必须落到真实状态管理与渲染链路",
                "priority": "P0",
                "rules": [
                    {
                        "target": "**/*.ets",
                        "ast": [
                            {"type": "decorator", "name": "ObservedV2"},
                            {"type": "call", "name": "ForEach"},
                        ],
                        "llm": "检查修复是否真正作用于列表渲染与状态跟踪链路。",
                    }
                ],
            }
        )

    constraints.append(
        {
            "id": "EXP-SHOULD-01",
            "name": "工程结构必须保持清晰的页面、组件与状态职责拆分",
            "priority": "P1",
            "rules": [
                {
                    "target": "**/*.ets",
                    "llm": "检查是否避免将业务逻辑、状态管理、权限处理和展示代码全部堆叠在单一页面文件中。",
                }
            ],
        }
    )

    constraints.append(
        {
            "id": "EXP-SHOULD-02",
            "name": "配置文件必须补齐场景所需权限与基础声明",
            "priority": "P1",
            "rules": [
                {
                    "target": "**/module.json5",
                    "llm": "检查是否补齐当前场景需要的权限、模块能力声明或基础配置。",
                }
            ],
        }
    )

    return constraints


def build_prompt(scenario: str, request_text: str, project_summary: dict) -> str:
    if scenario == "full_generation":
        return build_prd(request_text, project_summary)
    if scenario == "requirement":
        return build_requirement_prompt(request_text, project_summary)
    return request_text.strip()


def yaml_scalar(value: str) -> str:
    if value == "":
        return "''"
    if re.fullmatch(r"[A-Za-z0-9_\-./*@]+", value):
        return value
    return "'" + value.replace("'", "''") + "'"


def indent_block(text: str, spaces: int) -> list[str]:
    prefix = " " * spaces
    return [f"{prefix}{line}" if line else prefix.rstrip() for line in text.splitlines()]


def dump_case_yaml(case_meta: dict, constraints: list[dict]) -> str:
    lines = [
        "case:",
        f"  id: {yaml_scalar(case_meta['id'])}",
        f"  scenario: {yaml_scalar(case_meta['scenario'])}",
        f"  title: {yaml_scalar(case_meta['title'])}",
        "  prompt: |",
    ]
    lines.extend(indent_block(case_meta["prompt"], 4))
    lines.append("constraints:")

    for constraint in constraints:
        constraint_id = constraint["id"]
        priority = constraint["priority"]
        if priority not in ALLOWED_CONSTRAINT_PRIORITIES:
            raise ValueError(
                f"Unsupported constraint priority: {priority}. "
                f"Only {sorted(ALLOWED_CONSTRAINT_PRIORITIES)} are allowed."
            )
        match = CONSTRAINT_ID_PATTERN.fullmatch(constraint_id)
        if not match:
            raise ValueError(
                f"Unsupported constraint id: {constraint_id}. "
                "Expected format EXP-MUST-01 or EXP-SHOULD-01."
            )
        level = match.group(1)
        if priority == "P0" and level != "MUST":
            raise ValueError(f"Constraint id {constraint_id} must use MUST when priority is P0.")
        if priority == "P1" and level != "SHOULD":
            raise ValueError(f"Constraint id {constraint_id} must use SHOULD when priority is P1.")
        lines.append(f"  - id: {yaml_scalar(constraint_id)}")
        lines.append(f"    name: {yaml_scalar(constraint['name'])}")
        lines.append(f"    priority: {yaml_scalar(priority)}")
        lines.append("    rules:")
        for rule in constraint["rules"]:
            lines.append(f"      - target: {yaml_scalar(rule['target'])}")
            ast_items = rule.get("ast") or []
            if ast_items:
                lines.append("        ast:")
                for item in ast_items:
                    lines.append(f"          - type: {yaml_scalar(item['type'])}")
                    name = item.get("name")
                    target = item.get("target")
                    context = item.get("context")
                    if name:
                        lines.append(f"            name: {yaml_scalar(name)}")
                    if target:
                        lines.append(f"            target: {yaml_scalar(target)}")
                    if context:
                        lines.append(f"            context: {yaml_scalar(context)}")
            if rule.get("llm"):
                lines.append(f"        llm: {yaml_scalar(rule['llm'])}")
    return "\n".join(lines) + "\n"


def copy_original_project(src: Path, dst: Path) -> None:
    if dst.exists():
        shutil.rmtree(dst)
    shutil.copytree(src, dst, ignore=shutil.ignore_patterns(*IGNORE_DIRS))


def fallback_check_ignored_relpaths(project_root: Path, rel_paths: list[str]) -> set[str]:
    gitignore_path = project_root / ".gitignore"
    if not gitignore_path.is_file():
        return set()

    rules: list[tuple[str, bool, bool, bool]] = []
    for raw_line in read_text_if_exists(gitignore_path).splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#"):
            continue
        negated = line.startswith("!")
        if negated:
            line = line[1:].strip()
        if not line:
            continue
        directory_only = line.endswith("/")
        if directory_only:
            line = line[:-1]
        anchored = line.startswith("/")
        pattern = line.lstrip("/").replace("\\", "/")
        if pattern:
            rules.append((pattern, negated, directory_only, anchored))

    def match_pattern(rel_path: str, pattern: str, anchored: bool, directory_only: bool) -> bool:
        parts = rel_path.split("/")
        if directory_only:
            candidates = ["/".join(parts[:index]) for index in range(1, len(parts))]
        elif "/" in pattern:
            candidates = ["/".join(parts[index:]) for index in range(len(parts))]
        else:
            candidates = parts

        if anchored and candidates:
            candidates = candidates[:1]

        return any(fnmatch.fnmatchcase(candidate, pattern) for candidate in candidates)

    ignored: set[str] = set()
    for rel_path in rel_paths:
        state = False
        normalized = rel_path.replace("\\", "/")
        for pattern, negated, directory_only, anchored in rules:
            if match_pattern(normalized, pattern, anchored, directory_only):
                state = not negated
        if state:
            ignored.add(normalized)
    return ignored


def get_gitignored_relpaths(project_root: Path, rel_paths: list[str]) -> set[str]:
    if not rel_paths or not (project_root / ".gitignore").is_file():
        return set()

    ignored_relpaths: set[str] = set()
    try:
        for index in range(0, len(rel_paths), 200):
            batch = rel_paths[index : index + 200]
            result = subprocess.run(
                ["git", "check-ignore", "--no-index", *batch],
                text=True,
                capture_output=True,
                cwd=project_root,
                check=False,
            )
            if result.returncode not in {0, 1}:
                return fallback_check_ignored_relpaths(project_root, rel_paths)
            ignored_relpaths.update(
                line.strip().replace("\\", "/") for line in result.stdout.splitlines() if line.strip()
            )
    except FileNotFoundError:
        return fallback_check_ignored_relpaths(project_root, rel_paths)

    return ignored_relpaths


def create_gitignore_filtered_zip(project_root: Path) -> Path:
    archive_path = project_root / f"{project_root.name}.zip"
    if archive_path.exists():
        archive_path.unlink()

    files_to_zip: list[Path] = []
    for root, dirs, files in os.walk(project_root):
        dirs[:] = [item for item in dirs if item not in IGNORE_DIRS]
        for filename in files:
            path = Path(root) / filename
            if path == archive_path:
                continue
            files_to_zip.append(path)

    rel_paths = [path.relative_to(project_root).as_posix() for path in files_to_zip]
    ignored_relpaths = get_gitignored_relpaths(project_root, rel_paths)

    with zipfile.ZipFile(archive_path, "w", compression=zipfile.ZIP_DEFLATED) as zip_file:
        for path, rel_path in zip(files_to_zip, rel_paths):
            if rel_path in ignored_relpaths:
                continue
            zip_file.write(path, arcname=rel_path)

    return archive_path


def main() -> None:
    args = parse_args()
    if args.zip_only_project_root:
        zip_project_root = Path(args.zip_only_project_root).resolve()
        if not zip_project_root.is_dir():
            raise FileNotFoundError(f"Project root not found: {zip_project_root}")
        archive_path = create_gitignore_filtered_zip(zip_project_root)
        print(f"original_project_zip={archive_path}")
        return

    if not args.request:
        raise ValueError("--request is required unless --zip-only-project-root is used.")

    project_path = Path(args.project_path).resolve() if args.project_path else None
    if project_path and not project_path.exists():
        raise FileNotFoundError(f"Project path not found: {project_path}")

    if args.scenario:
        scenario = args.scenario
    elif project_path is None:
        scenario = detect_scenario_without_project(args.request)
    else:
        scenario = detect_scenario(args.request)

    output_root = Path(args.output_root).resolve()
    if project_path is None:
        if scenario != "full_generation":
            raise ValueError("未提供工程路径时，仅支持 full_generation；requirement 和 bug_fix 必须给定工程路径。")

        industry = extract_industry(args.request)
        if not industry:
            raise ValueError("未提供工程路径，且未能识别行业信息。请补充行业信息，或直接给定参考工程路径。")

        case_id = args.case_id or infer_case_id(scenario, industry, args.request)
        case_dir = output_root / scenario / case_id
        case_dir.mkdir(parents=True, exist_ok=True)

        directions = build_recommended_directions(industry)
        recommendations_dir = case_dir / "recommendations"
        recommendations_dir.mkdir(parents=True, exist_ok=True)
        recommendations_path = recommendations_dir / "产品方向推荐.md"
        recommendations_path.write_text(
            render_recommendations_markdown(industry, args.request, directions),
            encoding="utf-8",
        )

        print(f"scenario={scenario}")
        print(f"case_dir={case_dir}")
        print(f"recommendations={recommendations_path}")
        print("next_step=请选择推荐方向后，再生成 PRD 与 case.yaml")
        return

    case_id = args.case_id or infer_case_id(scenario, project_path.name, args.request)
    case_dir = output_root / scenario / case_id
    case_dir.mkdir(parents=True, exist_ok=True)

    summary = summarize_project(project_path)
    prompt = build_prompt(scenario, args.request, summary)
    title = build_title(scenario, args.request, summary)
    constraints = infer_ast_rules(args.request, summary, scenario)

    case_yaml = dump_case_yaml(
        {
            "id": case_id,
            "scenario": scenario,
            "title": title,
            "prompt": prompt,
        },
        constraints,
    )

    (case_dir / "case.yaml").write_text(case_yaml, encoding="utf-8")

    if scenario == "full_generation":
        prd_dir = case_dir / "prd"
        prd_dir.mkdir(parents=True, exist_ok=True)
        (prd_dir / "产品需求文档.md").write_text(prompt, encoding="utf-8")

    archive_path: Path | None = None
    defer_zip = args.defer_zip or (scenario == "requirement" and is_deletion_based_requirement(args.request))
    if scenario in {"requirement", "bug_fix"}:
        copy_original_project(project_path, case_dir / "original_project")
    if scenario == "requirement" and not defer_zip:
        archive_path = create_gitignore_filtered_zip(case_dir / "original_project")

    print(f"scenario={scenario}")
    print(f"case_dir={case_dir}")
    print(f"case_yaml={case_dir / 'case.yaml'}")
    if scenario == "full_generation":
        print(f"prd={case_dir / 'prd' / '产品需求文档.md'}")
    if scenario in {"requirement", "bug_fix"}:
        print(f"original_project={case_dir / 'original_project'}")
        if archive_path:
            print(f"original_project_zip={archive_path}")
        elif scenario == "requirement":
            print("next_step=请先在 original_project 中删除或裁剪已选功能代码，再使用 --zip-only-project-root 刷新 original_project.zip")
        else:
            print("next_step=请先在 original_project 中构造缺陷，再使用 --zip-only-project-root 刷新 original_project.zip")


if __name__ == "__main__":
    main()
