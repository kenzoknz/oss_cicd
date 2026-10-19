CC = gcc
CFLAGS = -Wall -Wextra -O3

# 1. Giai đoạn Biên dịch (Build)
build:
	$(CC) $(CFLAGS) prime_utils.c test_app.c -o validator

# 2. Giai đoạn Kiểm thử (Test)
test: build
	./validator

# 3. Giai đoạn Quét mã tĩnh (Lint) - Bắt lỗi phong cách và bug ngầm
lint:
	cppcheck --enable=all --suppress=missingIncludeSystem --error-exitcode=1 prime_utils.c test_app.c
	# Cppcheck không cần header thư viện chuẩn để phân tích mã nguồn; bỏ qua riêng thông báo này.
	# --error-exitcode=1 vẫn làm CI thất bại khi phát hiện cảnh báo/lỗi mã nguồn thực sự.

# 4. Dọn dẹp hệ thống
clean:
	rm -f validator *.tar.gz
