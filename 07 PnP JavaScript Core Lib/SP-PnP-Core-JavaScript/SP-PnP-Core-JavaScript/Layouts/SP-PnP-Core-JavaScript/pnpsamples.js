
function getWebTitle() {
    $pnp.sp.web.select("Title").get()
        .then(function(web) {
            console.log(web.Title);
        })
        .catch(function(error) {
            console.log(error);
        });
}

function getListForWeb() {
    $pnp.sp.web.lists.select('Id', 'Title').orderBy('Title').get()
        .then(function (listIds) {
            for (var index in listIds) {
                var l = $pnp.sp.web.lists.getById(listIds[index].Id);
                l.get()
                    .then(function (list) {
                        for (var key in list) {
                            console.log(key + ": " + list[key] );
                        }                        
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        })
        .catch(function (error) {
            console.log(error);
        });
}

function getListItems() {
    let list = $pnp.sp.web.lists.getByTitle("News");
      
    list.items.get()
        .then(function (items) {
            for (var i = 0; i < items.length; i++) {
                for (var key in items[i]) {
                    console.log(key + ": " + items[i][key] );
                }
            }
        })
        .catch(function (error) {
            console.log(error);
        });
}

function addListItem() {
    let list = $pnp.sp.web.lists.getByTitle("News");

    list.items.add({
            Title: "Title",
            Body: "Body for PnP Core JS List Item"
        }).then((iar) {
        console.log(iar);
    }); 
}


function updateListItem() {
    let list = $pnp.sp.web.lists.getByTitle("News");

    list.items.getById(1).update({
        Title: "My New Title",
        Body: "Here is a new body"
    }).then(i => {
        console.log(i);
    });
}

function deleteListItem() {
    let list = $pnp.sp.web.lists.getByTitle("News");

    list.items.getById(1).delete().then(() => console.log('item deleted'));
}
