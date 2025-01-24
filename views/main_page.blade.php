<!DOCTYPE html>
<html lang="ru">

<head>
  {{head}}
</head>

<body>
  {{header}}
<main>
 <div class="main_container">
 <section class="banner">
  <picture class="banner-image">
    <source srcset="[*home_banner_mobile*]" media="(max-width: 768px)">    
    <img src="[*home_banner_desktop*]" alt="home_banner<br>1400×250 | 900×300">
  </picture>
</section>

<section class="categories-section">
  <div class="categories">
    <div class="category-item">
      <div class="category-image">
        <span>category_image 120x120</span>
      </div>
      <p>Смартфоны</p>
    </div>
    <div class="category-item">
      <div class="category-image">
        <span>category_image 120x120</span>
      </div>
      <p>Планшеты</p>
    </div>
    <div class="category-item">
      <div class="category-image">
        <span>category_image 120x120</span>
      </div>
      <p>Ноутбуки</p>
    </div>
    <div class="category-item">
      <div class="category-image">
        <span>category_image 120x120</span>
      </div>
      <p>Наушники и аудиотехника</p>
    </div>
    <div class="category-item">
      <div class="category-image">
        <span>category_image 120x120</span>
      </div>
      <p>Телевизоры и видеотехника</p>
    </div>
    <div class="category-item">
      <div class="category-image">
        <span>category_image 120x120</span>
      </div>
      <p>Бытовая техника</p>
    </div>
  </div>
</section>


<div class="feedback_container">
  <section class="description">
	<h1>[*og_title*]</h1>
	<p>[*og_description*]</p>
  </section>

  <section class="contact-form">
  <form>
    <div class="form-group">
      <label for="name">Имя *</label>
      <input type="text" id="name" name="name" placeholder="Екатерина" required>
    </div>

    <div class="form-group">
      <label for="phone">Телефон *</label>
      <input type="tel" id="phone" name="phone" placeholder="+375 ___ __-__-__" required>
    </div>

    <div class="form-group">
      <label for="email">Email</label>
      <input type="email" id="email" name="email" placeholder="katya@mail.by">
    </div>

    <button type="submit">Отправить</button>
  </form>
</section>

</div>
</div>
</main>


  {{footer}}
</body>

</html>
