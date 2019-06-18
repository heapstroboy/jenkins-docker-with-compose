import jenkins.model.*
import com.cloudbees.plugins.credentials.*
import com.cloudbees.plugins.credentials.common.*
import com.cloudbees.plugins.credentials.domains.*
import com.cloudbees.plugins.credentials.impl.*
import com.cloudbees.jenkins.plugins.sshcredentials.impl.*

println("Setting credentials")

def domain = Domain.global()
def store = Jenkins.instance.getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')[0].getStore()

def dockerhubPassword = new File("/run/secrets/dockerhubPassword").text.trim()

def credentials=['username':'heapstroboy', 'password':dockerhubPassword,'description':'dockerhub']
def user = new UsernamePasswordCredentialsImpl(CredentialsScope.GLOBAL,'dockerhub', credentials.description, credentials.username, credentials.password)

store.addCredentials(domain, user)
