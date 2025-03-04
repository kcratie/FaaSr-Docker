ARG FAASR_VERSION
FROM kcratie/base-custom-flare:$FAASR_VERSION

# Get arguments
ARG FAASR_TAG
ARG FAASR_INSTALL_REPO

# Install FaaSr
RUN Rscript -e "args <- commandArgs(trailingOnly=TRUE); library(devtools); install_github(paste0(args[1],'@',args[2]),force=TRUE)" $FAASR_INSTALL_REPO $FAASR_TAG

WORKDIR /action

CMD ["Rscript", "faasr_start_invoke_github-actions.R"]
