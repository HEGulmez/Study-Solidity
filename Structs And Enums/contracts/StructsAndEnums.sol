// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructsAndEnums {
    
    
    
    enum Status {
        Taken, // 0
        Preparing, // 1
        Boxed, // 2
        Shipped // 3
    }

    struct Order {
        address customer;
        string zipCode;
        uint256[] products;
        Status status;
    }
    
    Order[] public orders;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function createOrder(string memory _zipCode, uint256[] memory _products) external returns(uint256) {
        require(_products.length > 0, "No products.");

        Order memory _order;
        _order.customer = msg.sender;
        _order.zipCode = _zipCode;
        _order.products = _products;
        _order.status = Status.Taken;

        orders.push(_order);

        return orders.length - 1;
    }

    function createOrder2(string memory _zipCode, uint256[] memory _products) external returns(uint256) {
        require(_products.length > 0, "No products.");

        orders.push(
            Order({
                customer: msg.sender,
                zipCode: _zipCode,
                products: _products,
                status: Status.Taken
            })
        );

        return orders.length - 1;
    }

    function createOrder3(string memory _zipCode, uint256[] memory _products) external returns(uint256) {
        require(_products.length > 0, "No products.");

        orders.push(Order(msg.sender, _zipCode, _products, Status.Taken));

        return orders.length - 1;
    }

    function advanceOrder(uint256 _orderId) public {
        require(msg.sender == owner, "You are not authorized.");
        require(_orderId < orders.length, "Not a valid order id.");

        Order storage order = orders[_orderId];
        require(order.status != Status.Shipped, "Order is already shipped.");

        if (order.status == Status.Taken){
            order.status = Status.Preparing;
        } else if (order.status == Status.Preparing){
            order.status = Status.Boxed;
        } else if (order.status == Status.Boxed){
            order.status = Status.Shipped;
        }
    }

    function getOrder(uint256 _orderId) external view returns(Order memory){
        require(_orderId < orders.length, "Not a valid order id.");

        /*
            Order memory order = orders[_orderId];
            return order; 
        */

        return orders[_orderId];
    }

    function updateZip(uint256 _orderId, string memory _zip) external {
        require(_orderId < orders.length, "Not a valid order id.");
        
        Order storage order = orders[_orderId];

        require(order.customer==msg.sender, "You are not the owner of the order");
        order.zipCode = _zip;
    }
}