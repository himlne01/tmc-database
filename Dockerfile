FROM public.ecr.aws/lts/mysql:latest
LABEL description="too many cooks mysql docker"
COPY ./init_scripts/ /docker-entrypoint-initdb.d/

