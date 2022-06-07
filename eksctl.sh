export AWS_ACCESS_KEY_ID=[...]

export AWS_SECRET_ACCESS_KEY=[...]

export KUBECONFIG=$PWD/kubeconfig.yaml

######################
# Creating a cluster #
######################

cat cluster-1.17.yaml

# Open https://eksctl.io/usage/schema/

eksctl create cluster \
    --config-file cluster-1.17.yaml

##########################
# Exploring the outcomes #
##########################

# Open AWS Web Console and make sure that us-west-2 is selected

eksctl get clusters --region us-west-2

kubectl get nodes

#################################
# Control plane logging Enabled #
#################################

aws eks update-cluster-config \
    --config-file cluster-1.17.yaml \
    --logging '{"clusterLogging":[{"types":["api","audit","authenticator","controllerManager","scheduler"],"enabled":true}]}'

###############################
# Upgrading the control plane #
###############################

diff cluster-1.17.yaml \
    cluster-1.18.yaml

eksctl upgrade cluster \
    --config-file cluster-1.18.yaml

eksctl upgrade cluster \
    --config-file cluster-1.18.yaml \
    --approve

kubectl get nodes

##########################
# Upgrading worker nodes #
##########################

eksctl create nodegroup \
    --config-file cluster-1.18.yaml

kubectl get nodes

eksctl delete nodegroup \
    --config-file cluster-1.18.yaml \
    --only-missing

eksctl delete nodegroup \
    --config-file cluster-1.18.yaml \
    --only-missing \
    --approve

kubectl get nodes

#######################
# Describing the version #
#######################

eksctl utils describe-addon-versions \
    --cluster devops-catalog \
    --region us-west-2

##########################
# Destroying the cluster #
##########################

eksctl delete cluster \
    --config-file cluster-1.18.yaml \
    --wait