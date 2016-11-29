
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

    function make_changes_in_app_configurations(key,value) {
      response ={};
      $.ajax({
        "async":false,
        global:false,
        url:"/app_configurations",
        type:"put",
        data:{
          config_key:key,
          config_value:value
        },
        success: function(res) {
          response = res;
        }
      });
      return response;
    }
