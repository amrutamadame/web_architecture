console.log("Script loaded");

const products = getAvailableProducts();
console.log(products);

// This should create the ul and the li's with the individual products details
function renderProducts(products) {
  // your code goes here
  const productList = document.createElement("ul");
  const main = document.querySelector("main");

  main.append(productList);

  for (const product of products) {
    const list = document.createElement("li");

    list.innerHTML = `
      <h2>Product Name: ${product.name}</h2>
      <p>Price: ${product.price}</p>
      <p>Rating: ${product.rating}</p>
    `;

    productList.append(list);
  }
}

renderProducts(products);
