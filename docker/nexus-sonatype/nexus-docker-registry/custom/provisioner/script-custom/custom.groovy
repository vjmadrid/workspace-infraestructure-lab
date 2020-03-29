import org.sonatype.nexus.blobstore.api.BlobStoreManager; 
import org.sonatype.nexus.repository.storage.WritePolicy; 

log.info('[INIT CUSTOM] Nexus Security Script')

/* SECURITY */ 

// Enable - Disable Anonymous access
security.setAnonymousAccess(false)
log.info('Config Anonymous access disabled ...')

// Change default password for admin user
def user = security.securitySystem.getUser('admin')
user.setEmailAddress('admin@admin.com')
security.securitySystem.updateUser(user)
security.securitySystem.changePassword('admin','admin123')
log.info('Config Default password for admin changed ...')

// Create Coporate admin user
def adminRole = ['nx-admin']
def adminUser = security.addUser('atsistemas', 'at', 'Sistemas', 'vjmadrid@atsistemas.com', true, 'atsistemas', adminRole)
log.info('Config Corporate Admin User created')

/* DOCKER REGISTRY */ 

// Create Docker registry
repository.createDockerHosted('docker-registry', 8083, null, BlobStoreManager.DEFAULT_BLOBSTORE_NAME, true, true, WritePolicy.ALLOW)
log.info('Config docker hosted created')

repository.createDockerProxy('docker-proxy', 'https://registry-1.docker.io', 'HUB', 'https://index.docker.io/v1/', null, null, BlobStoreManager.DEFAULT_BLOBSTORE_NAME, true, true)
log.info('Config docker proxy created')

def groupMembers = ['docker-registry', 'docker-proxy']
repository.createDockerGroup('docker-group', 8082, null, groupMembers, true, BlobStoreManager.DEFAULT_BLOBSTORE_NAME)
log.info('Config docker group created')

log.info('[END CUSTOM] Nexus Security Script completed successfully')

