<!DOCTYPE html>
<html lang="ru">

<head>
  {{head}}
</head>

<body>
  {{header}}
<main>
  <div class="category-page">
	{{pagetitle}}
  <div class="category-container">
    <aside class="category-sidebar">
      <button class="back-button">Каталог</button>
      <ul class="category-list">
        <li><a href="#">Смартфоны</a></li>
        <li><a href="#">Планшеты</a></li>
        <li><a href="#">Ноутбуки</a></li>
        <li><a href="#">Наушники и аудиотехника</a></li>
        <li><a href="#">Телевизоры и видеотехника</a></li>
        <li><a href="#">Бытовая техника</a></li>
      </ul>
    </aside>
    <section class="category-products">
      <div class="products-grid">
        <div class="product-card">
          <div class="product-image" style="background-image: url('[*product_image*]');">
			  product_image<br>400×400
			</div>
          <p class="product-price">[*product_price*] р.</p>
          <p class="product-name">[*product-name*]</p>
        </div>
        <div class="product-card">
          <div class="product-image">product_image<br>400×400</div>
          <p class="product-price">758,01 р.</p>
          <p class="product-name">Смартфон Xiaomi Redmi Note 10S 6/128 ГБ, синий</p>
        </div>
        <div class="product-card">
          <div class="product-image">product_image<br>400×400</div>
          <p class="product-price">758,01 р.</p>
          <p class="product-name">Смартфон Xiaomi Redmi 9A 2/32 ГБ, голубой</p>
        </div>
        <div class="product-card">
          <div class="product-image">product_image<br>400×400</div>
          <p class="product-price">758,01 р.</p>
          <p class="product-name">Смартфон Xiaomi Redmi Note 10 4/64 ГБ, серый</p>
        </div>
        <div class="product-card">
          <div class="product-image">product_image<br>400×400</div>
          <p class="product-price">758,01 р.</p>
          <p class="product-name">Смартфон Apple iPhone 13 512 ГБ, (PRODUCT) Red</p>
        </div>
      </div>
      <div class="pagination">
        <button>1</button>
        <button>2</button>
        <button>3</button>
        <button>4</button>
        <span>...</span>
        <button>12</button>
        <button>13</button>
      </div>
		<section class="seo-content">
			<h1>[*og_title*]</h1>
			<p>
				[*og_description*]
			</p>
	  </section>
    </section>
  </div>
  
		</div>
</main>



  {{footer}}
</body>

</html>
