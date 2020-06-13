module Fake

using CairoMakie, MakieLayout, FileIO, AbstractPlotting
CairoMakie.activate!()

function bad1()
    scene, layout = layoutscene()
    ax = layout[1,1] = LAxis(scene)
    FileIO.save("a.pdf", scene)
end

function bad2()
    scene = Scene()
    lines!(scene, rand(10))
    linesegments!(scene, rand(10) .+ 1)
    poly!(scene, Circle(Point2f0(0, 4), 1f0))
    FileIO.save("a.pdf", scene)
end

function bad3()
    scene = Scene(; show_axis = false)
    lines!(scene, rand(10))
    linesegments!(scene, rand(10) .+ 1)
    poly!(scene, Circle(Point2f0(0, 4), 1f0))
    FileIO.save("a.pdf", scene)
end

function bad4()
    scene = Scene(; show_axis = false)
    lines!(scene, rand(10))
    linesegments!(scene, rand(10) .+ 1)
    FileIO.save("a.pdf", scene)
end

function good1() # all good
    scene = Scene(; show_axis = false)
    FileIO.save("a.pdf", scene)
end

function good2() # all good
    scene = Scene()
    FileIO.save("a.pdf", scene)
end

function good3()
    scene = Scene(; show_axis = false)
    lines!(scene, rand(10))
    FileIO.save("a.pdf", scene)
end

end
