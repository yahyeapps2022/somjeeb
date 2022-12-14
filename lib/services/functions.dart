
 
/*


functions{


        - sync_backup_cloud(){
            export database from local DB and upload to cloudfare object storage 
            
        }
        
        
        - fix_contact_names(){
            if contact_is_allowed{
                loop all contacts First then if contact name not equal to name in the DB 
                update the name in the DB
            }
        
        }
        
        
        - save_trans_to_db(msg){
            if sms_is_allowed {
                - only save that 1 sms to DB
            }
        
        }
        
        
        
        - listen_for_new_sms(msg){
            - save_trans_to_db(msg)
            - fix_contact_names() 
            - sync_backup_cloud()   // mobile data is ok for uploads is unlimited
        }

          - sms_is_allowed(){
             // use sms package 
              return (sms_permistion_check)?true:false;
          }


} */