" Fix highlighting of return type right before colon, e.g. -> None:
syn match pythonTypeAnnotation /\v(->)\s*\zs[A-Za-z_][A-Za-z0-9_]*/ containedin=pythonFunction
hi def link pythonTypeAnnotation Type

