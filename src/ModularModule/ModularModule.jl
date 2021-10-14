module ModularModule

using Reexport

pkgmodules = ["SiblingModule1", "SiblingModule2"]

for pkgmodule in pkgmodules
    include("$pkgmodule.jl")
	eval(Meta.parse("@reexport using .$(Symbol(pkgmodule))"))
end

export modularmodule

modularmodule = true

end # module
