provider "kubernetes" {
}

####################################
#    Deploy Main App             ###
####################################

resource "kubernetes_deployment" "main" {
  metadata {
    name = "main"
    labels = {
      app = "main"
    }
  }

  spec {
    replicas = 1

  selector {
      match_labels = {
        app = "main"
      }
    }

    template {
      metadata {
        labels = {
          app = "main"
        }
      }

      spec {
        container {
          image = "mkingst/arcadia-main:latest"
          name  = "main"
          image_pull_policy = "IfNotPresent"

          port {
            container_port = "80"
           }

 }
        }
      }
    }
}

resource "kubernetes_service" "main" {
  metadata {
    name = "main"
    labels = {
      app = "main"
      service = "main"
    }
  }
  spec {
    selector = {
      app = "main"
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}

####################################
#    Deploy BackEnd              ###
####################################

resource "kubernetes_deployment" "backend" {
  metadata {
    name = "backend"
    labels = {
      app = "backend"
    }
  }

  spec {
    replicas = 1

  selector {
      match_labels = {
        app = "backend"
      }
    }

    template {
      metadata {
        labels = {
          app = "backend"
        }
      }

      spec {
        container {
          image = "mkingst/arcadia-backend:latest"
          name  = "backend"
          image_pull_policy = "IfNotPresent"

          port {
            container_port = "80"
           }

 }
        }
      }
    }
}

resource "kubernetes_service" "backend" {
  metadata {
    name = "backend"
    labels = {
      app = "backend"
      service = "backend"
    }
  }
  spec {
    selector = {
      app = "backend"
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}

####################################
#    Deploy App2                 ###
####################################

resource "kubernetes_deployment" "app2" {
  metadata {
    name = "app2"
    labels = {
      app = "app2"
    }
  }

  spec {
    replicas = 1

  selector {
      match_labels = {
        app = "app2"
      }
    }

    template {
      metadata {
        labels = {
          app = "app2"
        }
      }

      spec {
        container {
          image = "mkingst/arcadia-app2:latest"
          name  = "app2"
          image_pull_policy = "IfNotPresent"

          port {
            container_port = "80"
           }

 }
        }
      }
    }
}

resource "kubernetes_service" "app2" {
  metadata {
    name = "app2"
    labels = {
      app = "app2"
      service = "app2"
    }
  }
  spec {
    selector = {
      app = "app2"
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}


####################################
#    Deploy App3                 ###
####################################

resource "kubernetes_deployment" "app3" {
  metadata {
    name = "app3"
    labels = {
      app = "app3"
    }
  }

  spec {
    replicas = 1

  selector {
      match_labels = {
        app = "app3"
      }
    }

    template {
      metadata {
        labels = {
          app = "app3"
        }
      }

      spec {
        container {
          image = "mkingst/arcadia-app3:latest"
          name  = "app3"
          image_pull_policy = "IfNotPresent"
          
          port {
            container_port = "80"
           }
	
 }
        }
      }
    }
}

resource "kubernetes_service" "app3" {
  metadata {
    name = "app3"
    labels = {
      app = "app3"
      service = "app3"
    }
  }
  spec {
    selector = {
      app = "app3"
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}
