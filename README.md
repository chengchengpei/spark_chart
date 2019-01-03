# Apache Spark Helm Chart

Apache Spark is a fast and general-purpose cluster computing system.

* http://spark.apache.org/

Inspired from the following:
* https://github.com/helm/charts
* https://github.com/eddieesquivel/kubernetes-spark/tree/master/chart
* https://github.com/MacTynow/spark-chart

Spark docker image:
* https://hub.docker.com/r/gettyimages/spark

## Chart Details
Spark 2.2.1-hadoop-2.7 used.

## Issues
* k8s is running on openstack. NO idea how LoadBalancer works on k8s of openstack. still working on this.
* Hostnames or pod names of workers not resolvable?

## Installing the Chart

To install the chart with the release name `myspark`:

```
# Go to the chart directory
helm install --name myspark  --debug .
# Update /etc/hosts on each pod
# Update release name in update_hosts.sh
# Refer to issues
bash update_hosts.sh
```

## Uninstall the release `myspark`

```
helm del --purge myspark
```

## Configuration

The following tables lists the configurable parameters of the Spark chart and their default values.

### Spark Master

| Parameter               | Description                        | Default                                                    |
| ----------------------- | ---------------------------------- | ---------------------------------------------------------- |
| `Master.Name`           | Spark master name                  | `spark-master`                                             |
| `Master.Image`          | Container image name               | `gettyimages/spark`                                        | 
| `Master.ImageTag`       | Container image tag                | `2.2.1-hadoop-2.7`                                         |
| `Master.Replicas`       | k8s deployment replicas            | `1`                                                        |
| `Master.Component`      | k8s selector key                   | `spark-master`                                             |
| `Master.Cpu`            | container requested cpu            | `100m`                                                     |
| `Master.Memory`         | container requested memory         | `512Mi`                                                    |
| `Master.ServicePort`    | k8s service port                   | `7077`                                                     |
| `Master.ContainerPort`  | Container listening port           | `7077`                                                     |
| `Master.DaemonMemory`   | Master JVM Xms and Xmx option      | `1g`                                                       |

### Spark WebUi

|       Parameter       |           Description            |                         Default                          |
|-----------------------|----------------------------------|----------------------------------------------------------|
| `WebUi.Name`          | Spark webui name                 | `spark-webui`                                            |
| `WebUi.ServicePort`   | k8s service port                 | `8080`                                                   |
| `WebUi.ContainerPort` | Container listening port         | `8080`                                                   |

### Spark Worker

| Parameter                    | Description                        | Default                                                    |
| -----------------------      | ---------------------------------- | ---------------------------------------------------------- |
| `Worker.Name`                | Spark worker name                  | `spark-worker`                                             |
| `Worker.Image`               | Container image name               | `gettyimages/spark`                                        |
| `Worker.ImageTag`            | Container image tag                | `2.2.1-hadoop-2.7`                                         |
| `Worker.Replicas`            | k8s hpa and deployment replicas    | `3`                                                        |
| `Worker.ReplicasMax`         | k8s hpa max replicas               | `10`                                                       |
| `Worker.Component`           | k8s selector key                   | `spark-worker`                                             |
| `Worker.Cpu`                 | container requested cpu            | `100m`                                                     |
| `Worker.Memory`              | container requested memory         | `512Mi`                                                    |
| `Worker.ContainerPort`       | Container listening port           | `7077`                                                     |
| `Worker.CpuTargetPercentage` | k8s hpa cpu targetPercentage       | `50`                                                       |
| `Worker.DaemonMemory`        | Worker JVM Xms and Xmx setting     | `1g`                                                       |
| `Worker.ExecutorMemory`      | Worker memory available for executor | `1g`                                                     |

