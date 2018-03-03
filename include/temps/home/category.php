<?php

  $query = "SELECT * FROM `category`;";
  $result = $db->getRow($query);
  ?>
    <section id="category-section">
      <div class="container">
        <div class="title-section white">
          <h1>Book Categories</h1>
          <span></span>
        </div>
        <div class="category-box">
          <div class="row">
            <?php  while ($result && $row = mysqli_fetch_assoc($result)) :?>
            <div class="col-md-3 col-sm-6">
              <div class="cat-post">
                <img src="<?= $row['urlPic']?>" alt="">
                <div class="cat-hover">
                  <a href="#"><?php echo $row['Name'];?><br> <span><?= $row['Nu_Items']?> Items</span></a>
                </div>
              </div>
            </div>
            <?php endwhile;?>
          </div>

        </div>
      </div>
    </section>
<!-- End category section -->
