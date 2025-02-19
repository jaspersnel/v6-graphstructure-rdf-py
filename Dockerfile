# basic python3 image as base
FROM harbor.vantage6.ai/algorithms/algorithm-base

# This is a placeholder that should be overloaded by invoking
# docker build with '--build-arg PKG_NAME=...'
ARG PKG_NAME="v6_graphstructure_rdf_py"

# install federated algorithm
COPY . /app
RUN pip install /app

ENV PKG_NAME=${PKG_NAME}

# Tell docker to execute `ttl_graph_wrapper()` when the image is run.
# note that this is not the standard wrapper!
CMD python -c "from ${PKG_NAME}.docker_wrapper import sparql_graphstructure_wrapper; sparql_graphstructure_wrapper('${PKG_NAME}')"
