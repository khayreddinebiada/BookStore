<?php

  $qc = "SELECT * FROM `category`;";
  $rc = $db->getRow($qc);



  ?>
  <!-- shop-section
    ================================================== -->
  <div id="shop-section">
    <div id="scroll-wrap" class="container">
      <div class="title-section">
        <h1>Latest books</h1>
        <span></span>
      </div>

    <?php while ($rc && $rowc = mysqli_fetch_assoc($rc)) : ?>
      <?php
        $qp = "SELECT * FROM Product WHERE ID_Category = '".$rowc['ID_Category']."';";
        $rp = $db->getRow($qp);
      ?>
    <?php if ($rp) :?>
      <div class="title-line">
        <h1><?php echo $rowc['Name'];?> <a href="#">View All</a></h1>
      </div>
      <div id="bookshelf" class="bookshelf products-box">
        <!-- Book Item-->
        <?php while ($rp && $rowp = mysqli_fetch_assoc($rp)) : ?>
          <?php $details = getDetailsProduct($db,$rowp['ID_Details']); ?>
          <figure class="product-post">
            <div class="book" data-book="book-1">
              <img class="book-img" style="width: 180px; height:250px;" src="<?= $details['urlBook'];?>">
            </div>
            <div class="buttons">
              <a href="index.php?book=<?php echo $rowp['ID_Product']; ?>"> <?php echo $rowp['Title']; ?>
              </a> <span><?php if ($details) echo $details['Published_By']; ?></span>
            </div>
            <p class="rate">
              <?php
                $i = 1;
                while ($i <= 5)
                  {
                    if ($i < $rowp['Evaluation']) echo ('<i class="fa fa-star"></i>');
                    else echo '<i class="fa fa-star-o"></i>';
                    $i++;
                  }
                ?>
            </p>
            <span><?php echo $rowp['Price']; ?>$</span>
            <div class="product-links">
              <a class="add-cart-btn" href="#"><i class="fa fa-shopping-cart"></i><span>Add to Cart</span></a>
              <a href="#"><i class="fa fa-heart"></i></a>
              <a href="#"><i class="fa fa-align-justify"></i></a>
            </div>
          </figure>
        <?php endwhile; ?>
        <!--End Book Item-->

      </div>
      <?php endif; ?>
    <?php endwhile; ?>
    </div>

  </div>
  <!-- shop-section -->
