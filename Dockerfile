ARG SRC_IMG=dplain-mpich2
FROM qnib/${SRC_IMG}

ARG OSU_MPIBENCH_VER=5.3.2
ARG OSU_URL=http://mvapich.cse.ohio-state.edu/download/mvapich

RUN wget -qO - ${OSU_URL}/osu-micro-benchmarks-${OSU_MPIBENCH_VER}.tar.gz | tar xfz - -C /opt/ \
 && cd /opt/osu-micro-benchmarks-${OSU_MPIBENCH_VER}/ \
 && ./configure CC=mpicc CXX=mpicxx \
 && make \
 && make install
