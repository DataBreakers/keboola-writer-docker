# DataBreakers Keboola writer

This application provides Keboola writer for sending data to DataBreakers DataAPI.

## Configuration

Script needs a standard Keboola configuration with following custom parameters.

```
{
    "parameters": {
        "databreakers_account": DATABREAKERS_ACCOUNT_ID,
        "databreakers_secret_key": DATABREAKERS_API_SECRET,
        "delete_old_data": true|false
    },
}
```

You need to get `DATABREAKERS_ACCOUNT_ID` and `DATABREAKERS_API_SECRET` first to use the writer. Please contact keboola@databreakers.com if you don't have your account yet.
`delete_old_data` signifies if all actual data in your DataBreakers account will be deleted or you want to append new data to account actual dataset.

## Entities

Writer operates with three entites: *items*, *users*, *interactions*.

**Items** are entities that have their attributes and those attributes are analyzed by our natural language processing and text mining methods to compute similarity of those items. Attributes can be completely custom but most common attributes are: title, description, categories and price.

**Users** entities interact with items. No personal information is required, users can be completely anonymous and we need only it's unique identifier.

**Interactions** entities describe interactions between users and items in time. For example a purchase history of customers in e-shop.

To upload a set of entites into DataBreakers API, you have to create *csv* exports named accordingly to entity type: `users.csv`, `items.csv`, `interactions.csv`.

## Exports requirements

`items.csv` has to have **PK defined on one column**. Then it can have as many attributes (columns) as you need. Name of every column (except PK) will correspod to *item*'s attributes of *items* in DataBreakers dataset. This file is **not required**, you can use it to add explicit attributes to *items*.

`users.csv` has to have **PK defined on one column**. Then it can have as many attributes (columns) as you need. Name of every column (except PK) will correspod to *user*'s attributes of *users* in DataBreakers dataset. This file is **not required**, you can use it to add explicit attributes to *users*.

`interactions.csv` has to have exactly **4 columns** named as `user_id`, `item_id`, `timestamp`, `interaction_id` and **PK** on all these four columns. Default *interaction_id* set is defined as `[Detail view, Purchase, Recommendation, Dislike, Like, Bookmark]`. You can have your own extended set if you need, just contact support. This file **is required**. It will create empty *user* or *item* entity if *user_id* or *item_id* is not presented in your dataset.

-----

[DataBreakers](https://databreakers.com) – we are your data sense