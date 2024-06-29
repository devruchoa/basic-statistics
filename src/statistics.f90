module statistics
    implicit none
contains

    subroutine read_data(filename, data, n)
        character(len=*), intent(in) :: filename
        real, dimension(:), allocatable, intent(out) :: data
        integer, intent(out) :: n
        integer :: i, unit, ios

        n = 0

        open(newunit=unit, file=filename, status='old', action='read', iostat=ios)
        if (ios /= 0) then
            print *, 'Erro ao abrir o arquivo.'
            return
        end if

        do
            read(unit, *, iostat=ios)
            if (ios /= 0) exit
            n = n + 1
        end do

        if (n == 0) then
            print *, 'Arquivo vazio.'
            close(unit)
            return
        end if

        allocate(data(n))

        rewind(unit)
        do i = 1, n
            read(unit, *, iostat=ios) data(i)
            if (ios /= 0) then
                print *, 'Erro ao ler os dados.'
                deallocate(data)
                n = 0
                close(unit)
                return
            end if
        end do

        close(unit)
    end subroutine read_data

    function mean(data, n) result(m)
        real, dimension(n), intent(in) :: data
        integer, intent(in) :: n
        real :: m

        m = sum(data) / n
    end function mean

    function median(data, n) result(m)
        real, dimension(n), intent(in) :: data
        integer, intent(in) :: n
        real :: m
        real, dimension(n) :: sorted_data
        integer :: middle

        sorted_data = data
        call sort(sorted_data, n)
        middle = n / 2

        if (mod(n, 2) == 0) then
            m = (sorted_data(middle) + sorted_data(middle + 1)) / 2.0
        else
            m = sorted_data(middle + 1)
        end if
    end function median

    function stddev(data, n) result(s)
        real, dimension(n), intent(in) :: data
        integer, intent(in) :: n
        real :: s
        real :: m

        m = mean(data, n)
        s = sqrt(sum((data - m) ** 2) / (n - 1))
    end function stddev

    subroutine sort(array, n)
        real, dimension(n), intent(inout) :: array
        integer, intent(in) :: n
        integer :: i, j
        real :: temp

        do i = 1, n-1
            do j = i+1, n
                if (array(i) > array(j)) then
                    temp = array(i)
                    array(i) = array(j)
                    array(j) = temp
                end if
            end do
        end do
    end subroutine sort

end module statistics
