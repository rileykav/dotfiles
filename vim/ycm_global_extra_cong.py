def Settings(**kwargs):
    client_data = kwargs['client_data']
    return {
        'interpreter_path': client_data['g:ycm_python_interpreter_path'],
        'sys_path': client_data['g:ycm_python_sys_path'],
        'ls': {
            'pylsp': {
                'plugins': {
                    'pyflakes': {'enabled': False},
                    'flake8': {
                        'enabled': True,
                        'ignore': [
                            'E226',  # missing whitespace around arithmetic operator
                            # 'E203',  # whitespace before ‘,’, ‘;’, or ‘:’
                            'E303',  # too many blank lines (3)
                            'F401',  # module imported but not used
                        ],  # Example: ignore line length + line break warnings
                    }
                }
            }
        }
    }
