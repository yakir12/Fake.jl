module Fake

using CairoMakie, MakieLayout, FileIO, AbstractPlotting
CairoMakie.activate!()

function fake1()
    scene, layout = layoutscene()
    ax = layout[1,1] = LAxis(scene)
    FileIO.save("a.pdf", scene)
end

function fake2()
    scene = Scene()
    lines!(scene, rand(10))
    linesegments!(scene, rand(10) .+ 1)
    poly!(scene, Circle(Point2f0(0, 4), 1f0))
    FileIO.save("a.pdf", scene)
end

function fake3()
    scene = Scene(; show_axis = false)
    lines!(scene, rand(10))
    linesegments!(scene, rand(10) .+ 1)
    poly!(scene, Circle(Point2f0(0, 4), 1f0))
    FileIO.save("a.pdf", scene)
end

function fake4() # all good
    scene = Scene(; show_axis = false)
    FileIO.save("a.pdf", scene)
end

function fake5()
    scene = Scene(; show_axis = false)
    lines!(scene, rand(10))
    linesegments!(scene, rand(10) .+ 1)
    poly!(scene, Circle(Point2f0(0, 4), 1f0))
    FileIO.save("a.pdf", scene)
end

end
