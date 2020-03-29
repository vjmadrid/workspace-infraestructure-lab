import groovy.json.JsonOutput;

log.info('[INIT] Nexus Security Script')

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

log.info('[END] Nexus Security Script completed successfully')

return JsonOutput.toJson([user, adminUser])
