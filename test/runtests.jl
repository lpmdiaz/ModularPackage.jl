using Test, SafeTestsets

## individual modules

# exports from all modules and submodules are true
@safetestset "ModularPackage" begin
    using ModularPackage
    ModularPackage
    SomeModule
    ModularModule
    SiblingModule1
    SiblingModule2
    @test modularpackage
    @test somemodule
    @test modularmodule
    @test siblingmodule1
    @test siblingmodule2
end

# SomeModule only exports somemodule
@safetestset "SomeModule    " begin
    using ModularPackage.SomeModule
    SomeModule
    @test !@isdefined modularpackage
    @test somemodule
    @test !@isdefined modularmodule
    @test !@isdefined siblingmodule1
    @test !@isdefined siblingmodule2
end

# exports from ModularModule and its sibling modules
@safetestset "ModularModule " begin
    using ModularPackage.ModularModule
    ModularModule
    SiblingModule1
    SiblingModule2
    @test !@isdefined modularpackage
    @test !@isdefined somemodule
    @test modularmodule
    @test siblingmodule1
    @test siblingmodule2
end

# SiblingModule1 only exports siblingmodule1
@safetestset "SiblingModule1" begin
    using ModularPackage.ModularModule.SiblingModule1
    SiblingModule1
    @test !@isdefined modularpackage
    @test !@isdefined somemodule
    @test !@isdefined modularmodule
    @test siblingmodule1
    @test !@isdefined siblingmodule2
end

# SiblingModule2 only exports siblingmodule2
@safetestset "SiblingModule2" begin
    using ModularPackage.ModularModule.SiblingModule2
    SiblingModule2
    @test !@isdefined modularpackage
    @test !@isdefined somemodule
    @test !@isdefined modularmodule
    @test !@isdefined siblingmodule1
    @test siblingmodule2
end

## combinations of modules

# exports from SiblingModule1 and SiblingModule2 only are true
@safetestset "SiblingModule1 & SiblingModule2" begin
    using ModularPackage.ModularModule.SiblingModule1
    using ModularPackage.ModularModule.SiblingModule2
    SiblingModule1
    SiblingModule2
    @test !@isdefined modularpackage
    @test !@isdefined somemodule
    @test !@isdefined modularmodule
    @test siblingmodule1
    @test siblingmodule2
end

# exports from SomeModule and SiblingModule1 only are true
@safetestset "SomeModule & SiblingModule1    " begin
    using ModularPackage.SomeModule
    using ModularPackage.ModularModule.SiblingModule1
    SomeModule
    SiblingModule1
    @test !@isdefined modularpackage
    @test somemodule
    @test !@isdefined modularmodule
    @test siblingmodule1
    @test !@isdefined siblingmodule2
end
