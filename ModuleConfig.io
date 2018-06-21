ModuleConfig := Object clone

ModuleConfig moduleLoaderInstance := nil
ModuleConfig production := nil
ModuleConfig development := nil

ModuleConfig init := method(
    moduleLoaderInstance := ModuleLoader clone
)

ModuleConfig configure := method(
    basePath,

    moduleLoaderInstance configure(basePath)
)

ModuleConfig prodConfig := method(
    configurationBlock,

    production = method(
        configurationBlock call()
    )

    if(development == nil) \
        then(development = production)
    
    return self
)

ModuleConfig developmentConfig := method(
    configurationBlock,

    development = method(
        if(production != nil) \
            then(production())
            
        configurationBlock call()
    )
)