using { com.alfa02 as alfa02 } from '../db/schema';

service CustomerService {

    entity CustomerSrv as projection on alfa02.Customer;

}