#!/bin/bash
#npm install configurable-http-proxy
echo 'export PATH="/snap/bin:$PATH"' >> $HOME/.bashrc
echo 'export PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc
export PATH="/snap/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
jupyterhub --generate-config
jupyter notebook --generate-config
echo 'import os' >> $HOME/.jupyter/jupyter_notebook_config.py
echo 'c = get_config()' >>  $HOME/.jupyter/jupyter_notebook_config.py
echo "os.environ['LD_LIBRARY_PATH'] = '$HOME/fpylll/fpylll-env-py2/lib'" >>  $HOME/.jupyter/jupyter_notebook_config.py
echo "c.Spawner.env.update('LD_LIBRARY_PATH')" >>  $HOME/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.notebook_dir = u'$HOME/costas_folder'" >>  $HOME/.jupyter/jupyter_notebook_config.py
ipython kernel install --name "fpylll-env-py2" --user
