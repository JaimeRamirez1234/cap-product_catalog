using { com.alfa02 as alfa02 } from '../db/schema';

service CustomerService {

    //entity CustomerSrv as projection on alfa02.Customer;
     
    entity Products as projection on alfa02.Products;
    entity Car as projection on alfa02.Car;
    entity Suppliers as projection on alfa02.Suppliers;
    entity Categories as projection on alfa02.Categories;

    entity StockAvailability as projection on alfa02.StockAvailability;
    entity Currencies as projection on alfa02.Currencies;
    entity UnitOfMeasures as projection on alfa02.UnitOfMeasures;
    entity DimensionUnits as projection on alfa02.DimensionUnits;
    entity Months as projection on alfa02.Months;
    entity ProductReview as projection on alfa02.ProductReview;
    entity SalesData as projection on alfa02.SalesData;

    entity Orders as projection on alfa02.Orders;
    entity OrderItem as projection on alfa02.OrderItem;

}