dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
			username = "paulw"
			password = ""
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:mysql://localhost:3306/VermontDev?autoreconnect=true"
        }
    }

	test {
        dataSource {
			username = "ptwebb"
			password = ""
			dbCreate = "create-drop"
            url = "jdbc:mysql://localhost:3306/VermontTest?autoreconnect=true"
        }
    }
    production {
        dataSource {
			username = "ec2-user"
			password = ""
            dbCreate = "update"
            url = "jdbc:mysql://127.0.0.1:3306/Vermont?autoreconnect=true"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
