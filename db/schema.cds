namespace com.alfa02;

using {
    cuid,
    managed
} from '@sap/cds/common';

define type Name : String(50);

context materials {

    entity Products : cuid, managed {
        //key ID               : UUID;
        Name             : localized Name not null;
        Description      : localized String;
        ImageUrl         : String;
        ReleaseDate      : DateTime default $now;
        DiscontinuedDate : DateTime;
        Price            : Decimal(16, 2);
        Height           : type of Price;
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
        Suppliers_Id     : UUID;
        Supplier        : Association to sales.Suppliers;
        UnitOfMeasure    : Association to UnitOfMeasures;
        Currency         : Association to Currencies;
        DimensionUnit    : Association to DimensionUnits;
        Category         : Association to Categories;
        SalesDate      : Association to many sales.SalesData
                               on SalesDate.Product = $self;
        Reviews        : Association to many ProductReview
                               on Reviews.Product = $self;
    };

    entity Categories {
        key ID   : UUID;
            Name : localized String;
    };

    entity StockAvailability {
        key ID          : Integer;
            Description : localized String;
            Product     : Association to Products;
    };

    entity Currencies {
        key ID          : String(3);
            Description : localized String;
    };

    entity UnitOfMeasures {
        key ID          : String(2);
            Description : localized String;
    };

    entity DimensionUnits {
        key ID          : String(2);
            Description : localized String;
    };

    entity ProductReview : cuid, managed {
        //key ID      : UUID;
        Name    : String;
        Rating  : Integer;
        Comment : String;
        Product : Association to Products;
    };

    entity SelProducts   as select from Products;
    entity ProjProducts  as projection on Products;

    entity ProjProducts2 as
        projection on Products {
            *
        };

    entity ProjProducts3 as
        projection on Products {
            ReleaseDate,
            Name
        };

    extend Products with {
        PriceCondition     : String(2);
        PriceDetermination : String(3);
    };
}


//*************************Contesxt Sales*************************//

context sales {
    entity Orders : cuid {
        //key ID         : UUID;
        OrderItem : Composition of many OrderItems
                        on OrderItem.Order = $self;

    };

    entity OrderItems : cuid {
        key ID      : UUID;
            Order   : Association to Orders;
            Product : Association to materials.Products;
    };

    entity Suppliers : cuid, managed {
        //key ID      : UUID;
        Name    : materials.Products:Name;
        Address : Address;
        Email   : String;
        Phone   : String;
        Phone2  : String;
        Fax     : String;
        Product : Association to many materials.Products
                      on Product.Supplier = $self;
    };


    entity Months {
        key ID               : String(2);
            Description      : localized String;
            ShortDescription : localized String(3);
    };

    entity SelProducts1 as
        select from materials.Products {
            *
        };

    entity SelProducts2 as
        select from materials.Products {
            Name,
            Price,
            Quantity
        };

    entity SelProducts3 as
        select from materials.Products
        left join materials.ProductReview
            on Products.Name = ProductReview.Name
        {
            Rating,
            Products.Name,
            sum(Price) as TotalPrice
        }
        group by
            Rating,
            Products.Name
        order by
            Rating;

    entity SalesData : cuid, managed {
        //key ID            : UUID;
        DeliveryDate  : DateTime;
        Revenue       : Decimal(16, 2);
        Product       : Association to materials.Products;
        Currency      : Association to materials.Currencies;
        DeliveryMonth : Association to Months;
    };


}


type Address {
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
}
