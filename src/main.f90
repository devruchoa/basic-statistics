program main
    use statistics
    implicit none

    real, dimension(:), allocatable :: data
    integer :: n

    call read_data('data/sample_data.txt', data, n)

    if (n > 0) then
        print *, 'Média: ', mean(data, n)
        print *, 'Mediana: ', median(data, n)
        print *, 'Desvio Padrão: ', stddev(data, n)
    else
        print *, 'Nenhum dado foi lido.'
    end if

end program main
