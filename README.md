# cases-agent

仅保留自动生成测试用例功能，并按职责重新整理目录。

当前仅保留三类测试用例：

- `requirement`
- `bug_fix`
- `full_generation`

## 目录结构

```text
cases-agent/
├─ case_generation_agent.py # 生成脚本
├─ config/                  # Agent 配置
├─ data/seeds/              # 用例种子配置
├─ resources/
│  ├─ templates/            # 行业模板工程
│  └─ starter_projects/     # 空白起始工程
└─ output/test_cases/       # 生成结果
```

## 用法

安装依赖：

```bash
pip install pyyaml
```

执行生成：

```bash
python case_generation_agent.py
```

覆盖式重新生成：

```bash
python case_generation_agent.py --clean
```

生成结果默认输出到 `output/test_cases/`。
