import argparse


TEMPLATES = {
    "requirement": """case:
  id: req_example
  scenario: requirement
  title: 实现{行业}{功能}需求
  input: 基于当前工程继续做增量开发，补充新的业务链路，不要重做已有主流程。
  template_project: IndustryTemplate/ProjectName
  keywords:
    - 行业词
    - 业务词
    - ArkTS关键词
  template:
    name: ProjectName
    industry: 行业
    app_type: 应用
  existing_features:
    - 如果使用模板，则描述模板已有能力；如果未指定模板，则写明当前基础为空工程默认能力
  new_requirement_scope:
    - 本次新增能力
  template_constraints:
    - 如果使用模板，则约束保留现有首页与主链路；如果未指定模板，则约束在空工程基础上完成实现
  starter_kind: requirement_example
constraints:
  - name: 新增能力必须可被代码证据验证
    priority: P0
    rules:
      - target: "**/pages/*.ets"
        ast:
          - type: navigation
            target: TargetPage
        llm: 检查是否存在新增页面的导航入口
  - name: 页面结构或状态管理必须符合预期
    priority: P1
    rules:
      - target: "**/pages/TargetPage.ets"
        ast:
          - type: call
            name: Text
        llm: 检查新页面是否完成核心内容渲染
""",
    "bug_fix": """case:
  id: bug_fix_example
  scenario: bug_fix
  title: 修复{场景}{问题}缺陷
  input: 修复一个真实 HarmonyOS 缺陷。
  template_project: IndustryTemplate/ProjectName
  keywords:
    - 行业词
    - 缺陷词
    - ArkTS关键词
  template:
    name: ProjectName
    industry: 行业
    app_type: 应用
  problem_statement: 描述当前用户可见的问题现象与影响。
  fix_targets:
    - 需要修复的目标1
  starter_kind: bug_fix_example
constraints:
  - name: 修复必须落实为可观测代码模式
    priority: P0
    rules:
      - target: "**/pages/*.ets"
        ast:
          - type: decorator
            name: ObservedV2
        llm: 检查是否使用正确的状态管理或修复手法
  - name: 修复后页面行为必须可被证据验证
    priority: P1
    rules:
      - target: "**/pages/*.ets"
        ast:
          - type: call
            name: Text
        llm: 检查修复后的界面渲染与交互链路
""",
    "full_generation": """case:
  id: full_gen_example
  scenario: full_generation
  title: 生成{行业}{场景}工程
  input: 从零生成一个完整工程，明确用户角色、核心链路和系统能力。
  keywords:
    - 行业词
    - 角色词
    - ArkTS关键词
  template:
    name: ProjectName
    industry: 行业
    app_type: 应用
constraints:
  - name: 必须使用 Navigation 和 NavPathStack
    priority: P0
    rules:
      - target: "**/EntryAbility.ets"
        ast:
          - type: call
            name: NavPathStack
        llm: 检查是否使用新的导航栈方案
  - name: 必须使用 V2 状态管理体系
    priority: P0
    rules:
      - target: "**/*.ets"
        ast:
          - type: decorator
            name: ComponentV2
        llm: 检查是否整体采用 V2 组件体系
  - name: 工程结构必须完整分层
    priority: P1
    rules:
      - target: "**/*"
        llm: 检查是否包含 pages/components/models/services/constants 等分层
""",
}


def main() -> None:
    parser = argparse.ArgumentParser(description="打印指定场景的 case spec YAML 模板。")
    parser.add_argument("scenario", choices=sorted(TEMPLATES))
    args = parser.parse_args()
    print(TEMPLATES[args.scenario], end="")


if __name__ == "__main__":
    main()
