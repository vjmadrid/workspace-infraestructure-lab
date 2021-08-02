# workspace-jenkins


https://patorjk.com/software/taag/#p=display&f=Standard&t=Prepare%20%20%20Tools

https://github.com/openfrontier/docker-jenkins/tree/master/init.groovy.d

https://github.com/openfrontier/docker-jenkins/blob/master/Dockerfile
http://tdongsi.github.io/blog/2017/12/30/groovy-hook-script-and-jenkins-configuration-as-code/

https://github.com/showerlee/docker-compose-with-JCasC/blob/master/compose/jenkins-apm/conf/jenkins.sh

https://github.com/eficode-academy/jcasc-katas/blob/tools_katas/configuring-ssh/README.md

https://github.com/jenkinsci/configuration-as-code-plugin/tree/master/demos/git
https://github.com/jenkinsci/configuration-as-code-plugin/tree/master/demos/credentials


- [Instalar Jenkins](#instalar)
- [Gestion Jenkins](#gestion)
- [Configuración Jenkins](#configuracion)




## <a name="#instalar">Instalar Jenkins</a>

```bash
docker-compose -f docker-compose-casc.yaml up --build
```

## <a name="#gestion">Gestión Jenkins</a>

### Mostrar plugins instalados

Acceder a Manage Jenkins -> Script Console

```bash
  Jenkins.instance.pluginManager.plugins.each{
    plugin ->
    println ("${plugin.getShortName()}:${plugin.getVersion()}");
  }

  def pluginList = new ArrayList(Jenkins.instance.pluginManager.plugins)
  pluginList.sort { it.getShortName() }.each{
    plugin -> 
      println ("${plugin.getDisplayName()} (${plugin.getShortName()}): ${plugin.getVersion()}")
  }

  def pluginList = new ArrayList(Jenkins.instance.pluginManager.plugins)
  pluginList.sort { it.getShortName() }.each{
    plugin -> 
      println ("${plugin.getShortName()}:${plugin.getVersion()}")
  }
```

### Aprobar Script pendiente

```bash
import org.jenkinsci.plugins.scriptsecurity.scripts.ScriptApproval

ScriptApproval scriptApproval = ScriptApproval.get()
scriptApproval.pendingScripts.each {
    scriptApproval.approveScript(it.hash)
}
```

Jenkins -> Configure Gobal Secutiry

  CSRF Proteccion
    Desha bilitar : Enable script securituy for job DSL exploits

SE puede deshabilitar programaticamente la validacion

$JENKINS_HOME/init.groovy.d/disable-script-security.groovy

```bash
import javaposse.jobdsl.plugin.GlobalJobDslSecurityConfiguration
import jenkins.model.GlobalConfiguration

// disable Job DSL script approval
GlobalConfiguration.all().get(GlobalJobDslSecurityConfiguration.class).useScriptSecurity=false
GlobalConfiguration.all().get(GlobalJobDslSecurityConfiguration.class).save()
```


## <a name="#configuracion">Configuración Jenkins</a>

### Configuración vía CASC

https://github.com/jenkinsci/configuration-as-code-plugin/tree/master/demos


### Configuración vía groovy


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
