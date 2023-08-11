



employee 
    employee_id PK
    firstname
    lastname
    gender
    username
    password
    is_active
    create_at 

customer // one
    customer_id PK
    firstname
    lastname
    gender
    username
    password
    is_active
    create_at 
customer_address // many
    customer_address_id PK
    customer_id FK
    province_id FK
    firstname
    lastname
    tel
    address_des
    create_at

province
    province_id // PK
    name
    description
    date_modified
    date_added

category (menu)
    category_id PK
    name
    description
    parent_id
    create_at
    create_by

product
    product_id PK
    category_id FK
    barcode
    name
    quantity
    price
    image
    description
    is_active
    create_at
    create_by

product_image
    product_image_id
    product_id FK
    image
    sort_order

cart
    cart_id PK
    customer_id FK
    product_id FK
    quantity
    option
    create_at

order 
    order_id PK
    invvoice_no 
    customer_id FK
    order_status_id FK

    order_total
    
    firstname
    lastname
    email
    telelphone
    address_des

    payement_methode
    payment_cod
    comment
    create_at

order_detail
    order_product_id
    product_id FK
    product_name
    quantity 
    price 

order_status
    order_status_id
    name
    message
    sort_order
        Canceled  Your order has been canceled.
        Phone denied  We couldn't reach you at the moment! Please contact us back.
        Delivered  Your order is complete. We hope to see you shopping with us again soon!
        Preparing order  We're processing your order. We'll SMS you an update when it's ready for delivery/store pickup.
        Packed  Your order has been packed.
        Shipped  Get excited! Your order has been shipped!
        Store pick up  Your order is ready for store pickup!
        Pending Your order has been placed successfully! Thanks for shopping with ZANDO.

wishlist
    wishlist_id PK 
    product_id FK
    customer_id FK
    create_at 