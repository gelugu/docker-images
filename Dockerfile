FROM ubuntu:22.10

# Install general packages
RUN apt update && apt install --yes \
    pip \
    curl \
    unzip

# Install Helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh

# Install aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws && \
    aws --version

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/v1.21.2/bin/linux/amd64/kubectl" && \
    mv kubectl /bin && \
    chmod +x /bin/kubectl && \
    kubectl version --client
