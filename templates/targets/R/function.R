test_function = function(number_1, number_2){
  number_1 + number_2
}

plot_iris = function(data){
  data %>% 
    ggplot(aes(x = Sepal.Length, y = Sepal.Width, color = Petal.Length)) +
    geom_point() +
    scale_color_viridis_c()
}