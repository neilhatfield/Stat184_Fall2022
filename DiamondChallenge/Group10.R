#Nathanael Nemia, Yipeng Zhao, Supreeth Gokulnathan


#I included 2 summarise functions, The hard way + the easy way
#I have trouble with column names with easy way
summarise(
  diamonds,
  #Fair X
  FXcount = count(select(subset(diamonds, cut == "Fair"), x)),
  FXqs = quantile(select(subset(diamonds, cut == "Fair"), x),
                c(0,0.25,.5,.75,1), na.rm = TRUE),
  FXmad = mad(select(subset(diamonds, cut == "Fair"), x), na.rm = TRUE),
  FXmean = mean(as.numeric(unlist(select(subset(diamonds, cut == "Fair"), x))),
                na.rm = TRUE),
  FXstd = sd(as.numeric(unlist(select(subset(diamonds, cut == "Fair"), 
                                      x))), na.rm = TRUE),
  #Fair Y
  FYcount = count(select(subset(diamonds, cut == "Fair"), y)),
  FYqs = quantile(select(subset(diamonds, cut == "Fair"), y),
                 c(0,0.25,.5,.75,1), na.rm = TRUE),
  FYmad = mad(select(subset(diamonds, cut == "Fair"), y), na.rm = TRUE),
  FYmean = mean(as.numeric(unlist(select(subset(diamonds, cut == "Fair"), y))),
                na.rm = TRUE),
  FYstd = sd(as.numeric(unlist(select(subset(diamonds, cut == "Fair"), y))),
             na.rm = TRUE),
  
  #Fair Z
  FZcount = count(select(subset(diamonds, cut == "Fair"), z)),
  FZqs = quantile(select(subset(diamonds, cut == "Fair"), z),
                 c(0,0.25,.5,.75,1), na.rm = TRUE),
  FZmad = mad(select(subset(diamonds, cut == "Fair"), z), na.rm = TRUE),
  FZmean = mean(as.numeric(unlist(select(subset(diamonds, cut == "Fair"), z))),
                na.rm = TRUE),
  FZstd = sd(as.numeric(unlist(select(subset(diamonds, cut == "Fair"), z))),
             na.rm = TRUE),
  
  #Good X
  GXcount = count(select(subset(diamonds, cut == "Good"), x)),
  GXqs = quantile(select(subset(diamonds, cut == "Good"), x),
                c(0,0.25,.5,.75,1), na.rm = TRUE),
  GXmad = mad(select(subset(diamonds, cut == "Good"), x), na.rm = TRUE),
  GXmean = mean(as.numeric(unlist(select(subset(diamonds, cut == "Good"), x))),
                na.rm = TRUE),
  GXstd = sd(as.numeric(unlist(select(subset(diamonds, cut == "Good"), x))),
             na.rm = TRUE),
  #Good Y
  GYcount = count(select(subset(diamonds, cut == "Good"), y)),
  GYqs = quantile(select(subset(diamonds, cut == "Good"), y),
                 c(0,0.25,.5,.75,1), na.rm = TRUE),
  GYmad = mad(select(subset(diamonds, cut == "Good"), y), na.rm = TRUE),
  GYmean = mean(as.numeric(unlist(select(subset(diamonds, cut == "Good"), y))),
                na.rm = TRUE),
  GYstd = sd(as.numeric(unlist(select(subset(diamonds, cut == "Good"), y))),
             na.rm = TRUE),
  
  #Good Z
  GZcount = count(select(subset(diamonds, cut == "Good"), z)),
  GZqs = quantile(select(subset(diamonds, cut == "Good"), z),
                 c(0,0.25,.5,.75,1), na.rm = TRUE),
  GZmad = mad(select(subset(diamonds, cut == "Good"), z), na.rm = TRUE),
  GZmean = mean(as.numeric(unlist(select(subset(diamonds, cut == "Good"), z))),
                na.rm = TRUE),
  GZstd = sd(as.numeric(unlist(select(subset(diamonds, cut == "Good"), z))),
             na.rm = TRUE),
  
  #Very Good X
  VXcount = count(select(subset(diamonds, cut == "Very Good"), x)),
  VXqs = quantile(select(subset(diamonds, cut == "Very Good"), x),
                c(0,0.25,.5,.75,1), na.rm = TRUE),
  VXmad = mad(select(subset(diamonds, cut == "Very Good"), x), na.rm = TRUE),
  VXmean = mean(as.numeric(unlist(select(subset(diamonds, cut == "Very Good"), x))),
                na.rm = TRUE),
  VXstd = sd(as.numeric(unlist(select(subset(diamonds, cut == "Very Good"), x))),
             na.rm = TRUE),
  #Very Good Y
  VYcount = count(select(subset(diamonds, cut == "Very Good"), y)),
  VYqs = quantile(select(subset(diamonds, cut == "Very Good"), y),
                 c(0,0.25,.5,.75,1), na.rm = TRUE),
  VYmad = mad(select(subset(diamonds, cut == "Very Good"), y), na.rm = TRUE),
  VYmean = mean(as.numeric(unlist(select(subset(diamonds, cut == "Very Good"), y))),
                na.rm = TRUE),
  VYstd = sd(as.numeric(unlist(select(subset(diamonds, cut == "Very Good"), y))),
             na.rm = TRUE),
  
  #Very Good Z
  VZcount = count(select(subset(diamonds, cut == "Very Good"), z)),
  VZqs = quantile(select(subset(diamonds, cut == "Very Good"), z),
                 c(0,0.25,.5,.75,1), na.rm = TRUE),
  VZmad = mad(select(subset(diamonds, cut == "Very Good"), z), na.rm = TRUE),
  VZmean = mean(as.numeric(unlist(select(subset(diamonds, cut == "Very Good"), z))),
                na.rm = TRUE),
  VZstd = sd(as.numeric(unlist(select(subset(diamonds, cut == "Very Good"), z))),
             na.rm = TRUE),
  
  #Ideal X
  IXcount = count(select(subset(diamonds, cut == "Ideal"), x)),
  IXqs = quantile(select(subset(diamonds, cut == "Ideal"), x),
                c(0,0.25,.5,.75,1), na.rm = TRUE),
  IXmad = mad(select(subset(diamonds, cut == "Ideal"), x), na.rm = TRUE),
  IXmean = mean(as.numeric(unlist(select(subset(diamonds, cut == "Ideal"), x))),
                na.rm = TRUE),
  IXstd = sd(as.numeric(unlist(select(subset(diamonds, cut == "Ideal"), x))),
             na.rm = TRUE),
  #Ideal Y
  IYcount = count(select(subset(diamonds, cut == "Ideal"), y)),
  IYqs = quantile(select(subset(diamonds, cut == "Ideal"), y),
                 c(0,0.25,.5,.75,1), na.rm = TRUE),
  IYmad = mad(select(subset(diamonds, cut == "Ideal"), y), na.rm = TRUE),
  IYmean = mean(as.numeric(unlist(select(subset(diamonds, cut == "Ideal"), y))),
                na.rm = TRUE),
  IYstd = sd(as.numeric(unlist(select(subset(diamonds, cut == "Ideal"), y))),
             na.rm = TRUE),
  
  #Ideal Z
  IZcount = count(select(subset(diamonds, cut == "Ideal"), z)),
  IZqs = quantile(select(subset(diamonds, cut == "Ideal"), z),
                 c(0,0.25,.5,.75,1), na.rm = TRUE),
  IZmad = mad(select(subset(diamonds, cut == "Ideal"), z), na.rm = TRUE),
  IZmean = mean(as.numeric(unlist(select(subset(diamonds, cut == "Ideal"), z))),
                na.rm = TRUE),
  IZstd = sd(as.numeric(unlist(select(subset(diamonds, cut == "Ideal"), z))),
             na.rm = TRUE),
  
  #Premium X
  PXcount = count(select(subset(diamonds, cut == "Premium"), x)),
  PXqs = quantile(select(subset(diamonds, cut == "Premium"), x),
                c(0,0.25,.5,.75,1), na.rm = TRUE),
  PXmad = mad(select(subset(diamonds, cut == "Premium"), x), na.rm = TRUE),
  PXmean = mean(as.numeric(unlist(select(subset(diamonds, cut == "Premium"), x))),
                na.rm = TRUE),
  PXstd = sd(as.numeric(unlist(select(subset(diamonds, cut == "Premium"), x))),
             na.rm = TRUE),
  #Premium Y
  PYcount = count(select(subset(diamonds, cut == "Premium"), y)),
  PYqs = quantile(select(subset(diamonds, cut == "Premium"), y),
                 c(0,0.25,.5,.75,1), na.rm = TRUE),
  PYmad = mad(select(subset(diamonds, cut == "Premium"), y), na.rm = TRUE),
  PYmean = mean(as.numeric(unlist(select(subset(diamonds, cut == "Premium"), y))),
                na.rm = TRUE),
  PYstd = sd(as.numeric(unlist(select(subset(diamonds, cut == "Premium"), y))),
             na.rm = TRUE),
  
  
  #Premium Z
  PZcount = count(select(subset(diamonds, cut == "Premium"), z)),
  PZqs = quantile(select(subset(diamonds, cut == "Premium"), z),
                 c(0,0.25,.5,.75,1), na.rm = TRUE),
  PZmad = mad(select(subset(diamonds, cut == "Premium"), z), na.rm = TRUE),
  PZmean = mean(as.numeric(unlist(select(subset(diamonds, cut == "Premium"), z))),
                na.rm = TRUE),
  PZstd = sd(as.numeric(unlist(select(subset(diamonds, cut == "Premium"), z))),
             na.rm = TRUE),
  )


summarize(
    group_by(diamonds, cut),
  
    across(.cols = c(x,y,z), .fns = list(
      ~n(),
      ~mean(.x, na.rm = TRUE),
      ~quantile(.x,c(0,0.25,.5,.75,1), na.rm = TRUE),
      ~mad(.x, na.rm = TRUE),
      ~sd(.x, na.rm = TRUE)),
      .names = "{.col}_{.fn}")
  )
