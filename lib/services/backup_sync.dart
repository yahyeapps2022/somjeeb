/* 
require 'functions.dart'
require ':sms_packge'
require 'db_service.dart'


class backup_sync(){

 


       if (data_allready_downloaded() == false) {
            - dowload his backup.sql from cloudfare opject storage 
        
                - then import sql file to local DB 
                    update_db("db.status = 'downloaded")
            

                - then if (local_db_is_empty()) {
                            loop all transactions sms {
                                save_trans_to_db(msg)
                            } 
                    }

            - if (local_db_is_empty() == false) { 
                - fix_contact_names() 
                - then sync_backup_cloud();
            }             
        
}
 */