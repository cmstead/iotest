PackageConfig := ModuleConfig clone

PackageConfig init := method(
    prodConfig(block())
    devConfig(block())
)