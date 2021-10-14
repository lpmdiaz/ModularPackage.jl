module ModularPackage

using Reexport

pkgmodules = ["ModularModule", "SomeModule"]

for pkgmodule in pkgmodules
	if isdir(joinpath(dirname(@__FILE__), pkgmodule))
		include("$pkgmodule/$pkgmodule.jl") # package is in its own directory
	else
		include("$pkgmodule.jl") # package is at the current directory level
	end
	eval(Meta.parse("@reexport using .$(Symbol(pkgmodule))"))
end

export modularpackage

modularpackage = true

end # module
