import org.sonatype.nexus.blobstore.api.BlobStoreManager; 
import org.sonatype.nexus.repository.storage.WritePolicy; 

log.info('[INIT] Nexus Docker Registry Script')

// Create Docker registry

repository.createDockerHosted('docker-registry', 8083, null, BlobStoreManager.DEFAULT_BLOBSTORE_NAME, true, true, WritePolicy.ALLOW)
log.info('Config docker hosted created')

repository.createDockerProxy('docker-proxy', 'https://registry-1.docker.io', 'HUB', 'https://index.docker.io/v1/', null, null, BlobStoreManager.DEFAULT_BLOBSTORE_NAME, true, true)
log.info('Config docker proxy created')

def groupMembers = ['docker-registry', 'docker-proxy']
repository.createDockerGroup('docker-group', 8082, null, groupMembers, true, BlobStoreManager.DEFAULT_BLOBSTORE_NAME)
log.info('Config docker group created')

log.info('[END] Nexus Docker Resigtry Script completed successfully')
