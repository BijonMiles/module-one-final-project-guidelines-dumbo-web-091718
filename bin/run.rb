require_relative '../config/environment'



puts "HELLO WORLD"

count_id = 0


def welcome_account
  system "clear"
  account_check = nil
  until account_check == "y" || account_check == "n" || account_check == "e"
    puts "=================================================="
    puts "------ Welcome To Flatirons Banking System! ------"
    puts "=================================================="
    puts "                                              "
    puts "                    ********                   "
    puts "                  New Customer? y/n             "
    puts "                    ********                   "
    puts "                                              "
    puts "__________________________________________________"
    puts " E to EXIT"
    account_check = gets.chomp.downcase
    puts `clear`
    if account_check =="y" || account_check == "yes"
      create_account
    elsif account_check == "n" || account_check == "no"
      existing_account
    end
  end
end



def create_account
  confirm = "check"
  until confirm == "y"
    account_type = nil
    until account_type == "B" || account_type == "L" do

      puts "=================================================="
      puts "------ Welcome To Flatirons Banking System! ------"
      puts "=================================================="
      puts "                                              "
      puts "                                              "
      puts "              ~ $ ~ $ ~ $ ~ $ ~               "
      puts "              BORROWER OR LENDER              "
      puts "                      B/L                     "
      puts "                    ~ $ ~ $ ~                 "
      puts " _____________________________________________"
      account_type = gets.chomp
      account_type = account_type.upcase
    end
    account_name = nil
    until account_name != nil
      puts `clear`
      puts "                                              "
      puts "                                              "
      puts "**************************"
      puts "PLEASE ENTER YOUR FULLNAME"
      puts "**************************"
      account_name = gets.chomp
      puts "--------------------------"
      puts "                                                 "
    end
    puts "~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ ~ *"
    puts `clear`
    puts "                                              "
    puts "                                              "
    puts "**************************"
    puts "PASSWORD"
    puts "**************************"
    account_password = gets.chomp
    puts "--------------------------"
    puts "                                                 "
    age = 200
    until account_age > 18 && account_age < 80
      puts "~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ ~ *"
      puts "                            "
      puts "**************************"
      puts "      AGE:"
      puts "**************************"
      account_age = gets.chomp.to_i
    end
    puts "                                                 "
    puts "~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ ~ *"
    puts "                            "
    puts "**************************"
    puts "      ADDRESS:"
    puts "**************************"
    account_address = gets.chomp
    puts "                                                 "
      account_gender=nil
    until account_gender!="M" || account_gender!="F"
      puts "~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ ~ *"
      puts "                            "
      puts "**************************"
      puts "      GENDER: M/F "
      puts "**************************"
      account_gender = gets.chomp.upcase
    end
    puts "                                                 "
    puts "~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ ~ *"
    puts "                            "
    puts "**************************"
    puts "      INITIAL DEPOSIT:    "
    puts "**************************"
    account_balance = gets.chomp.to_f
    puts "                                                 "
    puts "~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ ~ *"
    puts "            "
    puts "            "
    puts `clear`
    puts "            "
    puts "========================================================"
    puts "Name: #{account_name}                   Age:#{account_age}"
    puts "Address: #{account_address}             Type:#{account_type}"
    puts "Gender: #{account_gender}           Balance: $#{account_balance}"
    puts "========================================================"
    puts " Is this Information correct? y/n"
    confirm = gets.chomp
  end

  if account_type == "L"
    LenderAccount.create(name: account_name, age: account_age, status: account_type, gender: account_gender, address: account_address, balance: account_balance,
                        password: account_password)
  else
    BorrowerAccount.create(name: account_name, age: account_age, status: account_type, gender: account_gender, address: account_address, balance: account_balance,
                        password: account_password)
  end
  existing_account
  # transaction_account
end

def existing_account
  puts "=================================================="
  puts "------ Welcome To Flatirons Banking System! ------"
  puts "=================================================="
  puts "                                              "
  puts "                                              "
  puts "      **************************"
  puts "      PLEASE ENTER YOUR FULLNAME"
  puts "      **************************"
  account_name = gets.chomp
  # puts "--------------------------"
  # puts "                                                 "
  # puts "~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ ~ *"
  # puts "                                              "
  # puts "              ~ $ ~ $ ~ $ ~ $ ~               "
  # puts "              BORROWER OR LENDER              "
  # puts "                      B/L                     "
  # puts "                    ~ $ ~ $ ~                 "
  # puts " _____________________________________________"
  # account_type = gets.chomp.upcase
  system "clear"
  puts "--------------------------"
  puts "                                                 "
  puts "~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ ~ *"
  puts "                                              "
  puts "                ~ $ ~ $ ~ $ ~ $ ~               "
  puts "                  PLEASE ENTER              "
  puts "                    PASSWORD                   "
  puts "                    ~ $ ~ $ ~                 "
  puts " _____________________________________________"
  account_password = gets.chomp


  user_account = LenderAccount.find_by(name: account_name)
  user_account ||= BorrowerAccount.find_by(name: account_name)

  if user_account == nil
    system "clear"
    puts "  "
    puts "This name is incorrect! Please try again"
    puts "Press ENTER to contunie"
    stall_var = gets.chomp
    puts `clear`
    welcome_account
  end

  if user_account.password == nil
    user_account.password = account_password
    user_account.save
  end

  if user_account.password != account_password
    system "clear"
    puts "              ****                "
    puts "    THIS PASSWORD IS INCORRECT  "
    puts "              ****                    "
    puts "                                  "
    puts "            TRY AGAIN"
    puts "  Press ENTER to Continue"
    time_stall = gets.chomp
    welcome_account
  end
  if user_account.status == "L"
    puts `clear`
    if user_account == nil
      puts "  "
      puts "This name is incorrect! Please try again"
      puts "Press ENTER to contunie"
      stall_var = gets.chomp
      puts `clear`
      welcome_account
    else

      puts 'clear'
      puts  "                           "
      puts "                                            "
      puts "================================================================"
      puts " Name: #{user_account.name}                 Age:#{user_account.age}"
      puts " Status: LENDER                 Address: #{user_account.address}"
      puts " Balance: $#{user_account.balance}                          ID: #{user_account.id}  "
      puts "================================================================"
      transaction_account
    end
  else
    # BorrowerAccount.all.find do | accounts |
    #   accounts.name == account_name
    user_account = BorrowerAccount.find_by(name: account_name)
    puts `clear`
    if user_account == nil
      puts "  "
      puts "This name is incorrect! Please try again"
      puts "Press ENTER to contunie"
      stall_var = gets.chomp
      puts `clear`
      welcome_account
    else
      puts `clear`
      puts "                                      "
      puts "                                      "
      puts "==========================================================="
      puts " Name: #{user_account.name}             Age:#{user_account.age}"
      puts " Status: BORROWER          Address: #{user_account.address}"
      puts " Balance: $#{user_account.balance}               ID: #{user_account.id}"
      puts "==========================================================="
      transaction_account
    end
  end
end

def transaction_account
  selection = nil
  until selection==1 || selection==2 || selection==3
    puts  "                                               "
    puts "=================================================="
    puts "------ Welcome To Flatirons Banking System! ------"
    puts "=================================================="
    puts "                    MAIN MENU                     "
    puts "                   ***********                    "
    puts "                                                  "
    puts "    DEPOSIT     BALANCE     WITHDRAW     EXIT     "
    puts "      (1)         (2)          (3)        (4)     "
    puts "                                                  "
    puts "    "
    puts "    TRANSFER                    "
    puts "       (5)                            "
    puts "__________________________________________________"
    selection = gets.chomp.to_i

    puts `clear`
    if selection == 1 || selection == 3 || selection == 2
      puts "            "
      account = nil
      until account != nil
        # until user_id != nil
        puts `clear`
        puts "++++++++++++++++++++++++++++++++++++++++++++++++"
        puts "                                              "
        puts "      NAME:"
        test_name = gets.chomp
        puts "                        "
        puts "      PASSWORD"
        user_id = gets.chomp
        # end
        account = LenderAccount.find_by(name: test_name)
        account ||= BorrowerAccount.find_by(name: test_name)

        # error here
        if account == nil
          puts "  +++++++++++++++++++++++++++++++++++++++++++++++++"
          system "clear"
          puts "                                        "
          puts " Error 404: This Account ID OR NAME does not exist!"
          puts "                  Please Try Again"
          puts "          "
          puts " Press Enter to Continue"
          puts " Enter M for Main Menu             "
          puts " Enter E for Exit"
          time_stall = gets.chomp.downcase
          if time_stall == "m"
            transaction_account
          elsif time_stall == "e"
            system "clear"
            exit
          end
        elsif (account.password != user_id)
          puts "  +++++++++++++++++++++++++++++++++++++++++++++++++"
          system "clear"
          puts "                                        "
          puts " Error 404: This Account PASSWORD is INCORRECT!"
          puts "                  Please Try Again"
          puts "          "
          puts " Press Enter to Continue"
          puts " Enter M for Main Menu             "
          puts " Enter E for Exit"
          puts "+++++++++++++++++++++++++++++++++++++++++++++++++++"
          account = nil
          time_stall = gets.chomp.downcase
          if time_stall == "m"
            transaction_account
          elsif time_stall == "e"
            system "clear"
            exit
          end
        end
      end

      system "clear"
      puts " ~ + ~ + ~ + ~ + ~ + ~ + ~ + ~ + ~ + ~ + ~ + ~ +"
      puts "                                      "
      # puts "Lender/Borrower? L/B"
      # type=gets.chomp.downcase
      puts "            "
      puts "+++++++++++++++++++++++++++++++++++++++++++++++++"
      if account.status == "L"
        account=LenderAccount.find_by(name: test_name)
        puts `clear`
        puts "=======================================  "
        puts "BALANCE: $#{account.balance}"
        puts "                            "
        if account.balance == nil
          account.balance = 0
        end
        if selection == 1
          puts "How much would you want to deposit?"
          deposit=gets.chomp.to_f
          account.balance+=deposit
          account.save
        elsif selection == 3
          puts "How much would you want to withdraw?"
          withdraw=20000
          until withdraw <= account.balance
            puts "How much do you want to withdraw?"
            withdraw=gets.chomp.to_f
            if withdraw > account.balance
              system "clear"
              puts "                  ********                     "
              puts "            INSUFFICIENT AMOUNT"
              puts "             PLEASE TRY AGAIN"
              puts "                   *****"
            end
          end
          account.balance-=withdraw
          account.save
        end
        system "clear"
        puts "                                      "
        puts "==========================================================="
        puts " Name: #{account.name}                        Age:#{account.age}"
        puts " Status: LENDER          Address: #{account.address}"
        puts " Balance: $#{account.balance}                        ID: #{account.id}"
        puts "==========================================================="
        puts "                        "
        puts " Finished? y/n"
        choice = gets.chomp.downcase
        if choice == "y" || choice == "yes"
          puts `clear`
        else
          selection = nil
          puts `clear`
        end
      elsif account.status == "B"
        account=BorrowerAccount.find_by(name: test_name)

        if account == nil
          puts "  +++++++++++++++++++++++++++++++++++++++++++++++++"
          system "clear"
          puts "                                        "
          puts " Error 404: This Account ID OR NAME does not exist!"
          puts "                  Please Try Again"
          puts "          "
          puts " Press Enter to Continue"
          puts " Enter M for Main Menu             "
          puts " Enter E for Exit"
          time_stall = gets.chomp.downcase
          if time_stall == "m"
            transaction_account
          elsif time_stall == "e"
            system "clear"
            exit
          end
        end


        puts `clear`
        puts "                            "
        puts "==========================================="
        puts "BALANCE: $#{account.balance}"
        puts "                              "
        system "clear"

        if account.balance == nil
          account.balance = 0
        end

        if selection == 1
          puts "How much do you want to deposit?"
          deposit=gets.chomp.to_f
          account.balance+=deposit
          account.save
        elsif selection == 3
          withdraw=20000
          until withdraw <= account.balance
            puts "How much do you want to withdraw?"
            withdraw=gets.chomp.to_f
            if withdraw > account.balance
              system "clear"
              puts "                  ********                     "
              puts "            INSUFFICIENT AMOUNT"
              puts "             PLEASE TRY AGAIN"
              puts "                   *****"
            end
          end
          account.balance-= withdraw
          account.save

        end
        puts `clear`
        puts "              $           $           $           $  "
        puts "==========================================================="
        puts " Name: #{account.name}             Age:#{account.age}"
        puts " Status: BORROWER          Address: #{account.address}"
        puts " Balance: $#{account.balance}                        ID: #{account.id}"
        puts "==========================================================="
        puts "              $           $           $           $ "
        puts " Finished? y/n"
        choice = gets.chomp.downcase
        if choice == "y" || choice == "yes"
          puts `clear`
        else
          selection = nil
          puts `clear`
        end
      end

    elsif selection == 6

      puts "            "
      puts "++++++++++++++++++++++++++++++++++++++++++++++++"
      puts "                                              "
      puts "What is your id?"
      user_id=gets.chomp.to_i
      puts "Lender/Borrower?  L/B"
      type=gets.chomp.downcase
      puts "            "
      puts "+++++++++++++++++++++++++++++++++++++++++++++++++"
      if type=="l"
        account=LenderAccount.find_by(id:user_id)

        if account.balance == nil
          account.balance = 0
        end

        puts `clear`
        puts "                                      "
        puts "==========================================================="
        puts " Name: #{account.name}                        Age:#{account.age}"
        puts " Status: LENDER          Address: #{account.address}"
        puts " Balance: $#{account.balance}                        ID: #{account.id}"
        puts "==========================================================="
        puts "                        "
      elsif type == "b"

        account=BorrowerAccount.find_by(id:user_id)

        if account.balance == nil
          account.balance = 0
        end

        puts `clear`
        puts "                                      "
        puts "==========================================================="
        puts " Name: #{account.name}                        Age:#{account.age}"
        puts " Status: LENDER          Address: #{account.address}"
        puts " Balance: $#{account.balance}                        ID: #{account.id}"
        puts "==========================================================="
        puts "                        "
      end
        puts " Finished? y/n"
        choice = gets.chomp.downcase
        if choice == "y" || choice == "yes"
          puts `clear`
        else
          selection = nil
          puts `clear`
        end


    elsif selection == 4
      puts "Thank You"
      exit
    elsif selection == 5
      transfer_money

    end
  end
end


def transfer_money
  account = nil
  until account != nil
    system "clear"
    puts "                                                    "
    puts "============================================================="
    puts "                    TRANSFER  DEPARTMENT                      "
    puts "============================================================="
    puts "*     *     *       *       *     *      *      *     *     *"
    puts "   *     *      *       *      *      *      *     *     *    "
    puts "                                                 "
    puts " NAME:      "
    test_name = gets.chomp
    puts "_______________________________________________________________"
    puts "            "
    puts "PASSWORD:                                         "
    account_password = gets.chomp

    account = BorrowerAccount.find_by(name: test_name)
    account ||= LenderAccount.find_by(name: test_name)

    if account == nil
      system "clear"
      puts "  +++++++++++++++++++++++++++++++++++++++++++++++++"
      puts "                                        "
      puts " Error 404: This Account ID OR NAME does not exist!"
      puts "                  Please Try Again"
      puts "          "
      puts " Press Enter to Continue"
      puts " Enter M for Main Menu             "
      puts " Enter E for Exit"
      time_stall = gets.chomp.downcase
      if time_stall == "m"
        transaction_account
      elsif time_stall == "e"
        system "clear"
        exit
      end
    elsif (account.password != account_password)
      puts "  +++++++++++++++++++++++++++++++++++++++++++++++++"
      system "clear"
      puts "                                        "
      puts " Error 404: This Account PASSWORD is INCORRECT!"
      puts "                  Please Try Again"
      puts "          "
      puts " Press Enter to Continue"
      puts " Enter M for Main Menu             "
      puts " Enter E for Exit"
      puts "+++++++++++++++++++++++++++++++++++++++++++++++++++"
      account = nil
      time_stall = gets.chomp.downcase
      if time_stall == "m"
        transaction_account
      elsif time_stall == "e"
        system "clear"
        exit
      end
    end

    puts `clear`
    puts "     *          *             *           *           *     "
    puts "==========================================================="
    puts " Name: #{account.name}                        Age:#{account.age}"
    puts " Status: #{account.status}          Address: #{account.address}"
    puts " Balance: $#{account.balance}                        ID: #{account.id}"
    puts "==========================================================="
    puts "     *          *             *           *           *                   "
    puts "                "
    puts "                                                "
    puts "TRANSFER FUND TO: "
    test_name2 = gets.chomp
  end
  account2 = nil
  until account2 != nil

    account2=BorrowerAccount.find_by(name: test_name2)
    account2 ||= LenderAccount.find_by(name: test_name2)

    if account2 == nil

      puts `clear`
      puts "    "
      puts " This Account Name doesn't exist, Please try again!"
      puts "    "
      puts "     *          *             *           *           *     "
      puts "==========================================================="
      puts " Name: #{account.name}                        Age:#{account.age}"
      puts " Status: #{account.status}          Address: #{account.address}"
      puts " Balance: $#{account.balance}                        ID: #{account.id}"
      puts "==========================================================="
      puts "     *          *             *           *           *                   "
      puts "                "
      puts "                                                "
      puts "TRANSFER FUND TO: "
      test_name2 = gets.chomp
    end
  end

  choices = nil
  until choices == "y" || choices == "yes"
    # put something here
    transfer_amount = 2000000000000000000000000000000
    until transfer_amount <= account.balance

      puts "                        "
      puts " TRANSFER AMOUNT:"
      transfer_amount = gets.chomp.to_f
      if transfer_amount > account.balance
        system "clear"
        puts "            ERROR ERROR ERROR"
        puts " Amount too much please Try Again!"
        puts "  "
      end
    end
    system "clear"
    puts "        "
    puts "                        TRANSFER DEPARTMENT                    "
    puts "================================================================="
    puts " #{account.name}  >>> $#{transfer_amount} >>> #{account2.name} "
    puts "================================================================="
    puts "            "
    puts " Is this correct? y/n                                  E for EXIT"
    puts "                                                  M for Main Menu"
    choices = gets.chomp.downcase
    if choices == "n"
      puts "Enter C to Change Amount "
      puts "Enter S to Start Over"
      choice = gets.chomp.downcase

      if choice == "s"
        transfer_money
      end
    end
    if choices == "e"
      system "clear"
      exit
    elsif choices == "m"
      transaction_account
    end
  end
  account.balance -= transfer_amount
  account2.balance += transfer_amount
  account.save
  account2.save

  system "clear"
  puts "                        TRANSFER COMPLETE                     "
  puts "     *          *             *           *           *     "
  puts "==========================================================="
  puts " Name: #{account.name}                        Age:#{account.age}"
  puts " Status: #{account.status}          Address: #{account.address}"
  puts " Balance: $#{account.balance}                        ID: #{account.id}"
  puts "==========================================================="
  puts "     *          *             *           *           *                   "
  puts "    "
  puts "                "
  puts "============================================================ "
  puts " Name: #{account2.name}         Amount Received:$ #{transfer_amount}"
  puts "============================================================"
  puts "    "
  puts " Press Enter To Continue"
  time_stall = gets.chomp

  transaction_account
  puts "    "
end
# def find_account
#
#
# end

# transaction_account
welcome_account
