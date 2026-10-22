# Diagrams

Editable sources are [PlantUML](https://plantuml.com/) text files; PNG and SVG exports are committed next to them so that the diagrams can be viewed and inserted into the thesis without tools.

| Diagram | Source | Exports | Task | Described in |
|---|---|---|---|---|
| System context | [context.puml](context.puml) | [PNG](context.png), [SVG](context.svg) | DOA-9 | [architecture.md, Section 2](../architecture.md#2-system-context) |
| Use cases | [use-case.puml](use-case.puml) | [PNG](use-case.png), [SVG](use-case.svg) | DOA-10 | [use-cases.md](../use-cases.md) |
| Components (draft) | [component.puml](component.puml) | [PNG](component.png), [SVG](component.svg) | DOA-9 | [architecture.md, Section 4](../architecture.md#4-components) |

[style.iuml](style.iuml) holds the common style (neutral colours for printing).

## How to edit and re-render

1. Edit the `.puml` file. A live preview is available in VS Code (PlantUML extension) or IntelliJ IDEA (PlantUML Integration plugin), or by pasting the text into the online editor at https://www.plantuml.com/plantuml.
2. Re-render both formats. The exports were made with PlantUML 1.2025.4, Graphviz 2.43 and Java 21:

```bash
cd docs/architecture/diagrams
java -DPLANTUML_LIMIT_SIZE=8192 -jar plantuml.jar -tpng *.puml
java -DPLANTUML_LIMIT_SIZE=8192 -jar plantuml.jar -tsvg *.puml
```

`plantuml.jar` is downloaded from https://github.com/plantuml/plantuml/releases and is not stored in the repository. Graphviz (`dot`) must be installed. `PLANTUML_LIMIT_SIZE` stops large diagrams from being cut off at 4096 pixels.

3. Commit the source and both exports together, so that they never differ.
