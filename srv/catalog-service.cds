using {com.alfa02 as alfa02} from '../db/schema';
using {com.training as training} from '../db/training';

service CatalogService {
    entity Products          as
        select from alfa02.materials.Products {
            ID,
            Name          as ProductName @mandatory,
            Description @mandatory, 
            ImageUrl,
            ReleaseDate,
            DiscontinuedDate,
            Price @mandatory,
            Height,
            Width,
            Depth,
            Quantity @mandatory,
            UnitOfMeasure as ToUnitOfMeasure @mandatory, 
            Currency      as ToCurrency @mandatory,
            Category      as ToCategory @mandatory,
            Category.Name as Category @mandatory,
            DimensionUnit as ToDimensionUnit @mandatory,
            SalesDate,
            Supplier,
            Reviews
        };

    entity Supplier          as
        select from alfa02.sales.Suppliers {
            ID,
            Name,
            Email,
            Phone,
            Fax,
            Product as ToProduct
        };

    @readonly
    entity Reviews           as
        select from alfa02.materials.ProductReview {
            ID,
            Name,
            Rating,
            Comment,
            createdAt,
            Product as ToProduct
        };

    @readonly
    entity SalesData         as
        select from alfa02.sales.SalesData {
            ID,
            DeliveryDate,
            Revenue,
            Currency.ID               as CurrencyKey,
            DeliveryMonth.ID          as DeliveryMonthId,
            DeliveryMonth.Description as DeliveryMonth,
            Product                   as ToProduct,
        };

    @readonly
    entity StockAvailability as
        select from alfa02.materials.StockAvailability {
            ID,
            Description,
            Product as ToProduct
        };

    @readonly
    entity VH_Categories     as
        select from alfa02.materials.Categories {
            ID   as Code,
            Name as Text
        };

    @readonly
    entity VH_Currencies     as
        select from alfa02.materials.Currencies {
            ID          as Code,
            Description as Text
        };

    @readonly
    entity VH_UnitOfMeasure  as
        select from alfa02.materials.UnitOfMeasures {
            ID          as Code,
            Description as Text
        };

    @readonly
    entity VH_DimensionUnits as
        select from alfa02.materials.DimensionUnits {
            ID          as Code,
            Description as Text
        };
}
