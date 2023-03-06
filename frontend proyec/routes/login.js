const url='http://localhost:3000/acceso'

const on = function(element,event,selector,handler){
    element.addEventListener(event,function(e){
        if(e.target.closest(selector)){
            handler(e)
        }
    })
}

// FrmData.addEventListener('submit', function(e) { 
//     e.preventDefault(); 
//     axios.post(url, { 
//       usuario: usuario.value, 
//       clave: clave.value 
//     }) 
//     .then(response => { 
//       localStorage.setItem('token', response.data.token); 
//       window.location.href = "home.html";
//     }) 
//     .catch(err => console.log(err)); 
//     return false;
//   });
  FrmData.addEventListener('submit', function(e) { 
    e.preventDefault(); 
    axios.post(url, { 
      usuario: usuario.value, 
      clave: clave.value 
    }
    ) 
    .then(response => {
        localStorage.setItem('token',response.data.token)
        if(response.data.token){
        window.location = "inicio.html";
        }
        else{
            confirm('datos incorrectos')
        }
    }
        )
    .catch(err => { 
        console.log(err); 
        
    }); 
    
});

  
 