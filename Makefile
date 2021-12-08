TAG ?= latest
WORKDIR ?= "/gpfs/slac/cryo/fs1/daq/dev/airflow/bin"

server:
	docker build . -t slaclab/cryoem-airflow:${TAG}
	docker push slaclab/cryoem-airflow:${TAG}

worker:
	docker build . -f Dockerfile.worker -t slaclab/cryoem-airflow-worker:${TAG}
	docker login -u slaclab 
	docker push slaclab/cryoem-airflow-worker:${TAG}
	singularity pull -F ${WORKDIR}/cryoem-airflow-worker\@${TAG}.sif docker://slaclab/cryoem-airflow-worker:${TAG}

dtn:
	docker build . -f Dockerfile.dtn -t slaclab/cryoem-airflow-dtn:${TAG}
	docker push slaclab/cryoem-airflow-dtn:${TAG}
