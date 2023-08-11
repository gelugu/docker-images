FROM --platform=linux/amd64 ubuntu:22.10

# Set environment variable to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install general packages, Helm, aws cli, and kubectl
RUN apt update && apt install --yes \
        curl \
        unzip \
        python3-pip && \
    # Install Helm
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh && \
    rm get_helm.sh && \
    # Install aws cli
    curl -f "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws && \
    # Install kubectl
    curl -fLO "https://dl.k8s.io/release/v1.21.2/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/ && \
    # Clean up
    apt clean && rm -rf /var/lib/apt/lists/* && \
    # Test installations
    helm version --client && \
    aws --version && \
    kubectl version --client
