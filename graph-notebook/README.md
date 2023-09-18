

* https://github.com/aws/graph-notebook

# copy premade starter notebooks
python -m graph_notebook.notebooks.install --destination ./notebooks/starter

# start jupyterlab
python -m graph_notebook.start_jupyterlab --jupyter-dir ./notebooks
