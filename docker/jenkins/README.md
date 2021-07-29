# workspace-jenkins

https://patorjk.com/software/taag/#p=display&f=Standard&t=Prepare%20%20%20Tools

https://github.com/openfrontier/docker-jenkins/tree/master/init.groovy.d


Manage Jenkins -> Script Console

 Jenkins.instance.pluginManager.plugins.each{
    plugin ->
    println ("${plugin.getShortName()}: ${plugin.getVersion()}");
  }

  def pluginList = new ArrayList(Jenkins.instance.pluginManager.plugins)
pluginList.sort { it.getShortName() }.each{
  plugin -> 
    println ("${plugin.getDisplayName()} (${plugin.getShortName()}): ${plugin.getVersion()}")
}

def pluginList = new ArrayList(Jenkins.instance.pluginManager.plugins)
pluginList.sort { it.getShortName() }.each{
  plugin -> 
    println ("${plugin.getShortName()}: ${plugin.getVersion()}")
}


#- script: |
#    pipelineJob('hello-pipeline-ext') {
#      definition { cpsScm {
#          scm {
#            git {
#              remote {
#                url ('https://github.com:kk-training/example.git')
#              }
#            }
#          }
#          scriptPath("jobs/casc-config/pipeline/Jenkinsfile")
#      } }
#    }
