
    function approve_ad(id){
      console.log(id);
      $.ajax({
      url: "/advertisements/approve_ads",
      type:"post",
      data: {
      id:id
      },
      success: function(response) {
        console.log(response)
      }
     })
    }

    function decline_ad(id){
      console.log(id);
      $.ajax({
      url: "/advertisements/decline_ads",
      type:"post",
      data: {
      id:id
      },
      success: function(response) {
        console.log(response)
      }
     })
    }
